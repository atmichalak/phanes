//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexander Michalak
// 
// Create Date: 09/20/2024 03:29:51 AM
// Design Name: 
// Module Name: top
// Project Name: phanes
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
import riscv_definitions::*;

module top(
    input logic         clk,
    input logic         reset,
    input logic [31:0]  operand_a,
    input logic [31:0]  operand_b,
    input alu_ops_t     alu_op,
    output logic [31:0] result,
    output logic        zero
    );
    
    alu u_alu (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_op(alu_op),
        .result(result),
        .zero(zero)
    );
endmodule
