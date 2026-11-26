`timescale 1ns / 1ps

module fulladder_tb;
  reg a;
  reg b;
  reg cin;

  wire sum;
  wire cout;

  integer i;

  fulladder uut (
    .a(a),
    .b(b),
    .cin(cin),

    .sum(sum),
    .cout(cout)
  );

  initial begin
    $dumpfile("fulladder.fst");
    $dumpvars(0, fulladder_tb);

    $monitor("Time = %0t | A = %b | B = %b | Cin = %b | Cout = %b | Sum = %b", $time, a, b, cin, cout, sum);

    for (i = 0; i < 8; i = i + 1) begin
      {a,b,cin} = i;
      #10;
    end
    $finish;

  end

endmodule

