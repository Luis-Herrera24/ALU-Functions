module sub_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,       
    output [3:0] Result, 
    output [3:0] Cout    
);

assign {Cout, Result} = A - B - Cin;

endmodule