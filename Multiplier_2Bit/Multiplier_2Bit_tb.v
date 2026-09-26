`timescale 1ns / 1ps

module Multiplier_2Bit_tb;
  reg a0, a1;
  reg b0, b1;

  wire p0, p1, p2, p3;

  integer i, j;

  Multiplier_2Bit uut (
    .a0(a0), .a1(a1),
    .b0(b0), .b1(b1),
    .p0(p0), .p1(p1), .p2(p2), .p3(p3)
  );

  initial begin
    $dumpfile("Multiplier_2Bit_dump.vcd");
    $dumpvars(0, Multiplier_2Bit_tb);


    $display("Time\t A (a1a0) \t B (b1b0) \t Product (p3p2p1p0)");
    $display("----------------------------------------------------");

    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        {a1, a0} = i;
        {b1, b0} = j;
        #10;
        $display("%0dns\t %b%b (%d)  \t %b%b (%d)  \t %b%b%b%b (%d)",
          $time, a1, a0, i, b1, b0, j, p3, p2, p1, p0, {p3, p2, p1, p0});
      end
    end

    $finish;
  end
endmodule
