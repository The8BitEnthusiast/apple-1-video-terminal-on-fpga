xvlog ../src/verilog/ic_2513.v ../src/testbenches/ic_2513_tb.v 
xelab -debug typical -top ic_2513_tb -snapshot ic_2513_tb_snapshot
xsim ic_2513_tb_snapshot --tclbatch xsim_cfg.tcl
