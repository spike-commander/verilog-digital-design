module Multiplier_2Bit(
  input wire a0, a1,  // Number A (2-bits)
  input wire b0, b1,  // Number B (2-bits)

  output wire p0, p1, p2, p3  // Product Result (4-bits)
);

  assign {p3, p2, p1, p0} = {a1, a0} * {b1, b0};

endmodule
