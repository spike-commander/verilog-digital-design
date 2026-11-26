# verilog learning stuff

just a messy repo where i am practicing digital logic design and messing around with verilog. trying to understand the hardware side of things rather than just writing software.

right now i'm working on linux using neovim to write code, iverilog to compile everything, and gtkwave / surfer to look at the waves.

### what's in here right now:
- basic nand, and, or, and nor gates to get started
- half adder and full adder circuits
- half subtractor and full subtractor circuits
- a 2-bit multiplier (hierarchical design)
- risc-v building blocks and processor modules

### how i run the simulations:
i usually just compile the testbench and main file together like this:
`iverilog -o multiplier_sim multiplier_2bit.v multiplier_2bit_tb.v`

then run it with vvp to generate the fst dump:
`vvp multiplier_sim -fst`

and finally open it up in surfer or gtkwave to check the waveforms and timing:
`surfer Multiplier_2bit_dump.fst`

gonna add more complex blocks as i learn them.
