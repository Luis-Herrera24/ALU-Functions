module benchtest_IntegratedModule;

  reg [3:0] A;
  reg [3:0] B;
  reg cin;
  reg [3:0] opcode;

  // Outputs
  wire [3:0] Y;
  wire [7:0] Y_8bit;
  wire [3:0] Cout;

  // Instantiate the integrated module
  integratedModule uut (
   .A(A),
   .B(B),
   .Cin(cin),
   .opcode(opcode),
   .Y(Y),
   .Y_8bit(Y_8bit),
   .Cout(Cout)
);


  // Initialize test vectors
  initial begin
    $dumpfile("integratedModule_test.vcd");
    $dumpvars(0, benchtest_IntegratedModule);

    // Test 1: AND operation (A=12, B=11)
    A = 4'b1100; 
    B = 4'b1011; 
    cin = 1;
    opcode = 4'b0000;
    #5;

    // Test 2: XOR operation (A=11, B=6)
    A = 4'b1011; 
    B = 4'b0110; 
    cin = 0;
    opcode = 4'b0011;
    #5;

    // Test 3: Addition (A=14, B=5)
    A = 4'b1110; 
    B = 4'b0101; 
    cin = 0;
    opcode = 4'b0111;
    #5;

    // Test 4: Right shift by 1 with fill (A=13, B=9)
    A = 4'b1101; 
    B = 4'b1001; 
    opcode = 4'b1010;
    #5;

    // Test 5: NAND operation (A=8, B=10)
    A = 4'b1000; 
    B = 4'b1010; 
    cin = 1;
    opcode = 4'b0001;
    #5;

    // Test 6: OR operation (A=5, B=14)
    A = 4'b0101; 
    B = 4'b1110; 
    cin = 0;
    opcode = 4'b0010;
    #5;

    // Test 7: XNOR operation (A=13, B=6)
    A = 4'b1101; 
    B = 4'b0110; 
    cin = 0;
    opcode = 4'b0100;
    #5;

    // Test 8: NOR operation (A=10, B=15)
    A = 4'b1010;  
    B = 4'b1111; 
    cin = 0;
    opcode = 4'b0101;
    #5;

    // Test 9: NOT operation (A=2, B=0)
    A = 4'b0010; 
    B = 4'b0000; 
    cin = 0;
    opcode = 4'b0110;
    #5;

    // Test 10: Subtraction (A=11, B=5)
    A = 4'b1011;
    B = 4'b0101; 
    cin = 0;
    opcode = 4'b1000;
    #5;

    // Test 11: Multiplication (A=12, B=3)
    A = 4'b1100; 
    B = 4'b0011; 
    cin = 0;
    opcode = 4'b1001;
    #5;

    $finish;
  end

endmodule
