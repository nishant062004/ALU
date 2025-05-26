`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: DESIGN A BASIC ALU SUPPORTING OPERATIONS LIKE ADDITION, SUBTRACTION, AND, OR, AND NOT.
// Module Name: ALU_tb
// Tool Versions:  Vivado 2024.1


module ALU_tb();

    reg [3:0] A, B;
    reg [2:0] sel;
    wire [3:0] Y;
    wire carry, zero;

    ALU dut (.A(A),.B(B),.sel(sel),.Y(Y),.carry(carry),.zero(zero));

    initial begin
        $monitor("A= %d, B= %d, Select= %d | Output= %d, Carry= %b, Zero Flag= %b", A, B, sel, Y, carry, zero);

        A = 4'b0011; B = 4'b0101;

        sel = 3'b000; #10; // ADD
        sel = 3'b001; #10; // SUB
        sel = 3'b010; #10; // AND
        sel = 3'b011; #10; // OR
        sel = 3'b100; #10; // NOT A
        sel = 3'b111; #10; // DEFAULT
        $finish;
    end

endmodule

