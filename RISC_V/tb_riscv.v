// tb_riscv.v
`timescale 1ns/1ps

module tb_riscv();
    reg clk;
    reg rst;
    reg [31:0] instruction;
    
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [31:0] reg3_value;

    // Instantiate upgraded core
    riscv_core uut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .reg3_value(reg3_value)
    );

    // Generate Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        instruction = 32'h0;
        
        $dumpfile("riscv_sim.fst");
        $dumpvars(0, tb_riscv);

        // Hold reset for 10ns
        #10;
        rst = 0;
        
        // Feed: ADD x3, x1, x2 (Hex: 32'h002081B3)
        // This will grab x1 (5) and x2 (3), add them, and put them in x3
        #10;
        instruction = 32'h002081B3;

        // Give it two full clock cycles to fetch data and write back
        #20;
        $display("Time=%0t | Opcode=%b | Destination Reg=x%0d | Stored Value in Register 3 = %0d", 
                 $time, opcode, rd, reg3_value);
        
        #10;
        $finish;
    end
endmodule
