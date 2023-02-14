xvlog --prj video_terminal.prj
xelab -debug typical -L xil_defaultlib -L unisims_ver \
    -L unimacro_ver -L secureip -L xpm \
    -snapshot video_terminal_tb_snapshot video_terminal_tb glbl
xsim video_terminal_tb_snapshot --tclbatch xsim_cfg.tcl
