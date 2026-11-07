# verilog learning stuff

just a messy repo where i am practicing digital logic design and messing around with verilog. trying to understand the hardware side of things rather than just writing software.

right now i'm working on linux using neovim to write code, iverilog to compile everything, and gtkwave to look at the waves. 

### what's in here right now:
- basic nand, and, or gate to get started
- half adder and full adder circuits
- a 2-bit multiplier (hierarchical design)
- half substractor and full substractor circuits

### how i run the simulations:
i usually just compile the testbench and main file together like this:
iverilog -o multiplier_sim multiplier_2bit.v multiplier_2bit_tb.v

then run it with vvp to generate the vcd dump:
vvp multiplier_sim -fst

and finally open it up in gtkwave to check the waveforms and timing:
surfer Multiplier_2bit_dump.fst

gonna add more complex blocks as i learn them.
