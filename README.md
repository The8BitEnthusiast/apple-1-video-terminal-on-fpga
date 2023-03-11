# Apple 1 Video Terminal on FPGA

![Splash](https://github.com/The8BitEnthusiast/apple-1-video-terminal-on-fpga/blob/main/graphics/splash.png?raw=true)

This project was primarily aimed at studying and documenting the video terminal circuit used on the Apple 1. In order to learn as much as I could about its behavior, I re-implemented the terminal's functionality on an FGPA board with Verilog, simulating several scenarios I was interested in. To test the circuit and see it in action, I created a simple latch-based register to interface with Ben Eater's breadboard 8-bit computer, tapping into its data bus and output module's signals to send ASCII characters to the terminal for display.

## How the Video Terminal Works

### Concept of Operations

During my research, I landed on this [article](https://www.sbprojects.net/projects/apple1/terminal.php). It does a great job explaining the basic operating principles behind the design, so I won't duplicate it. Instead, I will expand on it and get into greater depth on aspects that the author chose to leave out, like the timing and control circuitry. 

The diagram below presents the original video terminal display's schematics with a color-coded overlay highlighting the function of each area of the design.

![Overview](https://github.com/The8BitEnthusiast/apple-1-video-terminal-on-fpga/blob/main/graphics/overview.png?raw=true)

### Clock Generation

The video terminal uses a 14.31818 Mhz crystal and a series-resonant circuit to generate the main clock signal not only for the video terminal, but also for the entire computer. The following four secondary clock lines are generated through frequency division techniques:

1. DOT RATE: the pixel clock, running at half the main clock line (7.159 Mhz)
2. CHAR RATE: the character clock, running at 1/7th the pixel clock to account for 5 pixels per character and 2 more for spacing
3. LINE PHI: the line clock, which drives the line shift register. It is gated to only run outside of the horizontal blanking interval
4. MEM PHI: the video shift register clock. Same frequency as the line clock, but inverted (180 degree phase) and gated to only run on the following occasions:
   a. when a new line is loaded (timed with the 8th character scan line when the LINE 7 signal is asserted), for a total of 40 cycles
   b. during the vertical blanking interval, but only for a total of 64 cycles. This is necessary to shift and erase the free 64 characters that are available in the video shift registers (see video shift register section of the [primer article](https://www.sbprojects.net/projects/apple1/terminal.php) to learn more about these 64 characters). 

### Horizontal Timing and Control Signal Generation

The horizontal counter circuitry is composed of a 74LS160 decade counter and a 74LS161 binary counter chained together (D6 and D7 on the board). I believe the choice of using a decade counter was justified by the need to produce a specific horizontal blanking interval, as explained below.

The horizontal counters are designed to provide the horizontal timing signals based on the premise that this is a character-based display, not pixels. That is why the clock line feeding the counters is labeled "CHAR RATE", running at 1/7th the pixel clock rate. This makes sense given that each character is 5 pixels wide, and 2 more pixels are shifted out to produce some spacing between characters. 

The counters are configured to count for a total of 65 cycles before triggering the carry pin of the second counter and resetting to their preset value. Why 65 cycles? The first 25 are used to generate the horizontal blanking interval and sync pulse, and the remaining 40 are used for the display of characters. Remember that this is a 40X25 character display.

Key signals produced by the horizontal counter circuitry include:

   - ~HBL: Active low horizontal blanking interval
   - ~HSYNC: Active low sync pulse
   - LASTH: Tied to the carry out pin of the second counter, it signals the end of the line (count has reached 65)

### Vertical Timing and Control Signal Generation

The vertical counters are composed of two chained 74LS161 binary counters, labeled D8 and D9. They produce the following signals:

1. ~VBL and VBL: the vertical blanking interval, which starts at scan line 192 until the end of the frame
2. LAST: which denotes the last scan line at count 255

The vertical sync pulse is created by a separate 74LS161 binary counter at D15. It starts counting during the vertical blanking vertical and produces a sync pulse for a specific number of cycles.

The NTSC specification calls for a total of 262 lines per field. A field is normally half of a full interlaced frame, but this circuit does not produce an interlaced output, so 262 lines is the maximum vertical resolution. Still, this is 6 more lines than what the vertical counters are able to count, i.e. 256 lines. This where the ~VINH signal comes in. It is produced by the vertical pulse circuitry and will pulse low 6 times during the vertical interval. ~VINH is connected to the COUNT ENABLE pins of the vertical counters. As such, the net effect of this signal is to "hold" the vertical count 6 times, thus getting the line count to 262. It is also why I think VINH stands for 'Vertical Interval Hold'. 

### Video (Character) and Line (Row) Shift Registers

The article linked in the Concept of Operations section does a very good job at describing the overall behaviour of the shift registers. The diagram below presents an alternate, expanded view that combines both the main video (character) shift register and the line (row) shift registers.

![Shift Registers](https://github.com/The8BitEnthusiast/apple-1-video-terminal-on-fpga/blob/main/graphics/shift_registers.png?raw=true)

As you can see in the view above, the circuit is built with two groups of shift registers:

1. The video (character) shift register, composed of six Signetics 2504 1024x1 shift registers. So, across all 6 ICs, that means a total of 1024 6-bit characters can be stored
2. The line (row) shift register, a Signetics 2519 40x6 shift register, which holds the 40 6-bit characters currently being displayed 

You'll notice that each register group (video and line) rotates its content, i.e. their output feeds their inputs. However, this is done differently at each level:

1. the video shift register rotates its content by 40 characters only when a new line is loaded. Each character that is brought in is then loaded into the 2519 line register
2. once a fresh set of 40 characters (line) is loaded into the 2519 line register, each character is then shifted out to the character generator for output.

The video shift register will accept one of the following three inputs: 

1. A recirculated character from the video shift register, which is the default and most common state
2. The zero value, if the CLR line is asserted (high)
3. A new character, when the WRITE signal is asserted (low), which only occurs when the current location is at the cursor

You may surprised to hear the line register will rotate its content and shift out the same character 8 times over the course of displaying a line of characters. That is because each character has 8 pixel rows. As such, the same character has to be presented to the character ROM 8 times, once for each of the 8 horizontal scan lines.

### Cursor Tracking

Cursor tracking is done by another Signetics 2504 shift register that rotates at the same cadence as the video shift register. It basically provides a 7th bit to each character. A value of logic zero indicates that the character currently being output by the video shift register is at the current cursor location. 

When a character is written to the screen, logic '1' is inserted into the recirculated input to 'erase' the current cursor location, and on the next clock cycle, the ~WC2 signal is asserted to insert a logic '0' into the next location of the cursor shift register. This effectively moves the 'cursor location' to the next character location.

### Character Generation

Character generation is primarily done with the Signetics 2513 character ROM at D2. It contains 64 5X8 character pixel matrices. Its first three address pins are connected to the vertical counter's first three bits. These 3 bits specify each one of the 8 pixel rows for each character. The remaining 6 address pins select the character. 

The outputs of the character ROM drive the inputs of a 74LS166 shift register at D1, which shifts out each bit of the selected character pixel row to the composite video output circuitry, which is described in the section below

### Composite Video Output

Video output is produced by combining the pixel output (D1) and sync (C13) signals using a simple but effective digital to analog (D/A) conversion circuit, which is implemented with two series resistors. The output voltage is then buffered by an emitter-follower transistor circuit with a potentiometer at the output to adjust the video signal voltage level. 

### Carriage Return Handling 

The way this circuit handles carriage return was arguably one of the most interesting part of the board. It is implemented at C7 (74LS174 register) as a state machine that executes the following sequence:

1. Upon detection of the ascii code for CR, and at the cursor position, the machine enters a state in which characters are continuously blanked on the screen
2. Upon reaching the end of line (signal LASTH is asserted by the horizontal counters), the state machine emits the Wrap Cursor signals (WC1 and WC2) to update the cursor location in the cursor tracking register, and also to scroll the page if this takes place at the last line, as explained in the next section. The state machine then reverts back to its default, normal state.

### Scrolling

Scrolling on this circuit is an extremely clever piece of engineering. It is initiated by detecting an attempt to wrap the cursor after entering the vertical blanking interval, i.e. after the last location on the screen at line 192. A single OR gate at C9 implements this feature by checking if both ~WC2 and ~VBL are asserted. The output of the OR gate is connected to the parallel load pins of the counters, which load the preset value of 191. As such, once that condition is met, the vertical count is set back by one line, from 192 to 191, allowing the extra blank line stored in the video shift register to be rolled in for display. 

## FPGA Design Approach

### Design Abstraction Level: Gate vs Behavioural Modeling

For this project I opted to go for "gate level" implementation approach, duplicating each chip I found on the Apple 1 blueprint, rather than trying to remodel and simplify the design at a higher abstraction level, which I believe is referred to as 'behavioral'. As such, you will see plenty of source files using a "ic_XXXX" naming convention, where XXXX is the chip's series identifier (e.g. 74161 for a binary counter).

The only variant on this approach was for basic logic gates, like AND, NAND, OR, and NOR. For this, I used Verilog's existing primitives instead of modeling them as their IC chip equivalent. These are shown as logic gates on the Apple 1 video terminal schematics, so I felt this was a good fit. 

### Replacing Analog Aspects with FPGA Digital Equivalents

The original Apple 1 video circuit used several MOS components (mostly the Signetics chips) that required a -12V and -5V rails, as well as pull-down resistors. These chips also required a funky alternating dual clock input. I got rid of that and re-implemented these chips with simple single clock input. That also allowed me to get rid the MOS clock driver circuitry.

Another area of intervention was replacing the diode-based logic gates with their digital equivalent.

## 8-Bit CPU Interface
