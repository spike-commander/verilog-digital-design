// riscv_core.v
module riscv_core(
    input clk,
    input rst,
    input [31:0] instruction,
    output [6:0] opcode,
    output [4:0] rd,
    output reg [31:0] reg3_value // Expose register 3 value to watch in waves
);
    // 1. Decode / Instruction Slicing Fields
    assign opcode = instruction[6:0];
    assign rd     = instruction[11:7];   // Destination Register Address
    wire [4:0] rs1 = instruction[19:15]; // Source Register 1 Address
    wire [4:0] rs2 = instruction[24:20]; // Source Register 2 Address

    // 2. Internal Register File Storage Array (x0 to x31)
    reg [31:0] registers [31:0];
    
    // Internal Wires to hold data pulled out of storage
    wire [31:0] reg_data1 = registers[rs1];
    wire [31:0] reg_data2 = registers[rs2];
    
    // 3. ALU (Arithmetic Logic Unit) - Computes actual math
    wire [31:0] alu_result = reg_data1 + reg_data2;

    // 4. Sequential Hardware State Updates
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all register banks to initial zero state
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (opcode == 7'b0110011) begin
            // Hardcode test data values directly into source registers for verification
            registers[1] <= 32'd5; // Put 5 inside Register x1
            registers[2] <= 32'd3; // Put 3 inside Register x2
            
            // Execute command and store result into the selected destination register (x3)
            registers[rd] <= alu_result;
        end
    end

    // Continuously assign the internal value of Register 3 to the output wire
    always @(*) begin
        reg3_value = registers[3];
    end

endmodule
