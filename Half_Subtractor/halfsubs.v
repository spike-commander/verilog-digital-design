module halfsubs (
  input wire a,
  input wire b,

  output wire dif,
  output wire brw
);
  assign dif = a ^ b;
  assign brw = (~a) & b;

endmodule
