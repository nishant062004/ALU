`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: DESIGN A BASIC ALU SUPPORTING OPERATIONS LIKE ADDITION, SUBTRACTION, AND, OR, AND NOT.
// Module Name: ALU
// Tool Versions: Vivado 2024.1

module ALU(
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    input [2:0] sel,    // 3-bit select line
    output reg [3:0] Y, // 4-bit ALU output
    output reg carry,   // Carry output for addition
    output reg zero     // Zero flag
);

    always @(*) begin
        carry = 0;
        case (sel)
            3'b000: {carry, Y} = A + B;     // Addition
            3'b001: Y = A - B;              // Subtraction
            3'b010: Y = A & B;              // AND
            3'b011: Y = A | B;              // OR
            3'b100: Y = ~A;                 // NOT A
            default: Y = 4'b0000;
        endcase

        zero = (Y == 4'b0000) ? 1 : 0;//For Zero Flag
    end

endmodule
