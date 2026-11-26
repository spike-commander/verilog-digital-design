`timescale 1ns / 1ps

module halfadder_tb;
  reg a;
  reg b;

  wire sum;
  wire carry;

  integer i;

  halfadder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    $dumpfile("halfadder.fst");
    $dumpvars(0, halfadder_tb);

    $monitor ("Time = %0t | a = %b | b = %b | carry = %b | sum = %b", $time, a, b, carry, sum);

    for (i = 0; i < 4 ; i = i + 1) begin
      {a, b} = i;
      #10;
    end

    $finish;
  
  end

endmodule
