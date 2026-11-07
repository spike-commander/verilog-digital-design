`timescale 1ns / 1ps
module halfsubs_tb;
  reg a;
  reg b;

  wire dif;
  wire brw;

  wire signed [1:0] combined_result = {brw, dif};

  halfsubs uut(
    .a(a),
    .b(b),
    .dif(dif),
    .brw(brw)
  );

  integer i;
  initial begin
    $dumpfile("halfsubs_sim.vcd");
    $dumpvars(0, halfsubs_tb);
    
    $monitor("Time = %0t | A = %b | B = %b | Difference = %b | Borrow = %b | Signed Decimal = %d", $time, a, b, dif, brw, combined_result);
    
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end
    $finish;
  end

endmodule

