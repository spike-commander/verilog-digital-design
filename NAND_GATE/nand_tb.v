`timescale 1ns / 1ps

module nand_tb;
  reg a;
  reg b;

  wire y;

  nand_gate uut (
    .a(a),
    .b(b),
    .y(y)
  );

  integer i;

  initial begin
    $dumpfile("nand_gate.fst");
    $dumpvars(0, nand_tb);

    $monitor("Time = %0t | a = %b | b = %b | y = %b", $time, a, b, y);

    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end
    $finish;

  end

endmodule
