`timescale 1ns / 1ps

module full_adder_tb;
  reg a;
  reg b;
  reg cin;

  wire sum;
  wire cout;

  full_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("full_adder_dump.vcd");
    $dumpvars(0, full_adder_tb);

    a=0; b=0; cin=0; #10; // 0+0+0 = 00 in binary
    a=0; b=0; cin=1; #10; // 0+0+1 = 01 in binary
    a=0; b=1; cin=0; #10; // 0+1+0 = 01 in binary
    a=0; b=1; cin=1; #10; // 0+1+1 = 10 in binary (Decimal 2)
    a=1; b=0; cin=0; #10; // 1+0+0 = 01 in binary
    a=1; b=0; cin=1; #10; // 1+0+1 = 10 in binary (Decimal 2)
    a=1; b=1; cin=0; #10; // 1+1+0 = 10 in binary (Decimal 2)
    a=1; b=1; cin=1; #10; // 1+1+1 = 11 in binary (Decimal 3!)

    $finish;
  end
endmodule
