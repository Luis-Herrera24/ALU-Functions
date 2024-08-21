module integratedModule (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    input [3:0] opcode, // 4-bit opcode to select the operation
    output [3:0] Cout,
    output [3:0] Y,
    output [7:0] Y_8bit
);

  // Internal signals
  wire [3:0] Y_and, Y_nand, Y_or, Y_xor, Y_xnor, Y_nor, Y_not, Y_shifter,Y_add,Y_sub;

  wire [7:0] Y_multi; // Separate wire for add, sub and multiplication result

  // Module instantiations
  and_4bit and_inst (
    .A(A),
    .B(B),
    .Y(Y_and)  
  );

  nand_4bit nand_inst (
    .A(A),
    .B(B),
    .Y(Y_nand)
  );

  or_4bit or_inst (
    .A(A),
    .B(B),
    .Y(Y_or)
  );

  xor_4bit xor_inst (
    .A(A),
    .B(B),
    .Y(Y_xor)
  );

  xnor_4bit xnor_inst (
    .A(A),
    .B(B),
    .Y(Y_xnor)
  );

  nor_4bit nor_inst (
    .A(A),
    .B(B),
    .Y(Y_nor)
  );

  not_4bit not_inst (
    .A(A),
    .Y(Y_not)
  );

  newShifter shifter_inst(
    .A(A),
    .B(B),
    .Y(Y_shifter)
  );

  add_4bit add_inst (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Y_add)
    
  );

  sub_4bit sub_inst (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Result(Y_sub)
  );

  multi_4bit multi_inst (
    .A(A),
    .B(B),
    .Product(Y_multi)
  );

 assign Y = (opcode == 4'b0000) ? Y_and :
            (opcode == 4'b0001) ? Y_nand :
            (opcode == 4'b0010) ? Y_or :
            (opcode == 4'b0011) ? Y_xor :
            (opcode == 4'b0100) ? Y_xnor :
            (opcode == 4'b0101) ? Y_nor :
            (opcode == 4'b0110) ? Y_not :
            (opcode == 4'b0111) ? Y_add :
            (opcode == 4'b1000) ? Y_sub :
            (opcode == 4'b1010) ? Y_shifter :
                                  4'b0; 
assign Y_8bit = (opcode == 4'b1001) ? Y_multi: 
                                  8'b0;

                                  
endmodule
