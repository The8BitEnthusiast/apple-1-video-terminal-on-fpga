# Check IP
if { [file isdirectory ../"ip"] } {
    # if the IP file exisst, we already generated the IP, so we
    # can just read the IP definition (.xci)
    read_ip ../ip/clk_gen/clk_gen.xci
} else {
    # ip folder does not exist. Create the IP folder
    file mkdir ../ip

    # create_ip requires that a project is open in memory.
    # We create a project, but don't do anything with it
    create_project -part XC7A35TFTG256-1 -in_memory

    # create ip
    create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name clk_gen -dir ../ip
    set_property -dict [list \
          CONFIG.CLKIN1_JITTER_PS {200.0} \
          CONFIG.CLKOUT1_JITTER {355.651} \
          CONFIG.CLKOUT1_PHASE_ERROR {237.634} \
          CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {14.31818} \
          CONFIG.CLK_OUT1_PORT {clk_out} \
          CONFIG.Component_Name {clk_gen} \
          CONFIG.MMCM_CLKFBOUT_MULT_F {39.375} \
          CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
          CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
          CONFIG.MMCM_CLKOUT0_DIVIDE_F {68.750} \
          CONFIG.MMCM_DIVCLK_DIVIDE {2} \
          CONFIG.PRIMARY_PORT {clk_in} \
          CONFIG.PRIM_IN_FREQ {50} \
          CONFIG.USE_RESET {false} \
        ] [get_ips clk_gen]
    
    generate_target all [get_ips]

    # Synthesize all the IP
    synth_ip [get_ips]
}

