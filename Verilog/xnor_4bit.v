module xnor_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y
);

assign Y = ~(A ^ B);

endmodule