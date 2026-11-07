module fullsubs (
    input wire a,
    input wire b,
    input wire brw_in,

    output wire diff,
    output wire brw_out
);
  assign diff = a ^ b ^ brw_in;
  assign brw_out = (~a & b) | (~a & brw_in) | (b & brw_in);

endmodule
