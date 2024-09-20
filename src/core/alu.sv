//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexander Michalak
// 
// Create Date: 09/20/2024 03:33:25 AM
// Design Name: 
// Module Name: alu
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

module alu(
    input logic [31:0] operand_a,
    input logic [31:0] operand_b,
    input alu_ops_t    alu_op,
    output logic[31:0] result,
    output logic       zero
    );
    
    always_comb begin
        case (alu_op)
            ALU_ADD: result = operand_a + operand_b;
            ALU_SUB: result = operand_a - operand_b;
            ALU_AND: result = operand_a & operand_b;
            ALU_OR:  result = operand_a | operand_b;
            ALU_XOR: result = operand_a ^ operand_b;
            ALU_SLT: result = ($signed(operand_a) < $signed(operand_b)) ? 32'd1 : 32'd0;
            ALU_SLL: result = operand_a << operand_b[4:0];
            ALU_SRL: result = operand_a >> operand_b[4:0];
            ALU_SRA: result = $signed(operand_a) >>> operand_b[4:0];
            default: result = 32'd0;
        endcase
    end
    
    assign zero = (result == 32'd0);
endmodule
