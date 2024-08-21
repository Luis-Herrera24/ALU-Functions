module multi_4bit (
    input [3:0] A,
    input [3:0] B,
    output [7:0] Product
);

wire [7:0] partial_products[0:3]; 
wire [7:0] sum;                   

generate
    genvar i; // Declare 'i' for generate loop
    for (i = 0; i < 4; i = i + 1) begin : gen_mult
        // Generate the partial products by AND operation then shifts the result left by i bits.
        assign partial_products[i] = (A & (B[i] ? 4'b1111 : 4'b0000)) << i;
    end
endgenerate

// Calculate the sum of the partial products
assign sum = partial_products[0] + partial_products[1] + partial_products[2] + partial_products[3];

assign Product = sum; // Product is the sum of the partial products

endmodule
