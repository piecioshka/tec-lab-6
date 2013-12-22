 restart
 add wave -radix unsigned *
 force reset 1 0
 force clk 0 0, 1 {50 ps} -r 100
 force x 0 0
 run
 force reset 0 0
 run
 run
 force x 1 0
 run