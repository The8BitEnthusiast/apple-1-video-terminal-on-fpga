xvlog --prj video_terminal.prj
xelab -debug typical -top video_terminal_tb -snapshot video_terminal_tb_snapshot
xsim video_terminal_tb_snapshot --tclbatch xsim_cfg.tcl
