`timescale 1ns / 1ps
module fullsubs_tb;
  reg a;
  reg b;
  reg brw_in;

  wire diff;
  wire brw_out;

  wire signed [1:0] combined_result = {brw_out, diff};

  fullsubs uut (
  .a(a),
  .b(b),
  .brw_in(brw_in),
  .diff(diff),
  .brw_out(brw_out)
  );

  integer i;
  initial begin
    $dumpfile("fullsubs_sim.fst");
    $dumpvars(0, fullsubs_tb);

    $monitor("Time = %0t | A = %b | B = %b | Borrow-In = %b | Difference = %b | Borrow-Out = %b | Signed Decimal = %d", $time, a, b, brw_in, diff, brw_out, combined_result);

    for (i = 0; i < 8; i = i + 1) begin
      {a, b, brw_in} = i;
      #10;
    end
    $finish;
  end

endmodule
