module newShifter (
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [3:0] Y
);

  wire shift = B[3];               // 1sh bit in B dictates direction 
  wire [2:1] shift_amount = B[2:1]; // Bits 1 and 2 in B tell the amount
  wire fill = B[0];                 // 1ast bit in B is fill or full

  assign Y = (shift) ?
             ((fill) ? {A[3], A[3:1]} << shift_amount : A << shift_amount) :
             ((fill) ? {A[2:0], A[0]} >> shift_amount : A >> shift_amount);

endmodule
