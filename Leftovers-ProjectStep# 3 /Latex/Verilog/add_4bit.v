module add_4bit(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] Sum,
    output wire [3:0] Cout
);

assign {Cout, Sum} = A + B + Cin;

endmodule
