set outputDir ../output
file mkdir $outputDir

read_ip ../ip/clk_gen/clk_gen.xci
read_verilog ../src/verilog/and_3.v
read_verilog ../src/verilog/ic_2504.v
read_verilog ../src/verilog/ic_2519.v
read_verilog ../src/verilog/ic_7400.v
read_verilog ../src/verilog/ic_7404.v
read_verilog ../src/verilog/ic_74160.v
read_verilog ../src/verilog/ic_74166.v
read_verilog ../src/verilog/ic_74173.v
read_verilog ../src/verilog/ic_74273.v
read_verilog ../src/verilog/ic_74175.v
read_verilog ../src/verilog/nand_3.v
read_verilog ../src/verilog/or_3.v
read_verilog ../src/verilog/and_or_invert.v 
read_verilog ../src/verilog/ic_2513.v
read_verilog ../src/verilog/ic_555.v
read_verilog ../src/verilog/ic_7402.v
read_verilog ../src/verilog/ic_74157.v
read_verilog ../src/verilog/ic_74161.v
read_verilog ../src/verilog/ic_74174.v
read_verilog ../src/verilog/ic_7427.v
read_verilog ../src/verilog/nor_3.v 
read_verilog ../src/verilog/video_terminal.v
read_verilog ../src/verilog/top.v

read_xdc ../src/constraints/mercury2.xdc

synth_design -top top -part XC7A35TFTG256-1 -rtl
start_gui

