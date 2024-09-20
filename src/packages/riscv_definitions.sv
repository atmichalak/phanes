//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexander Michalak
// 
// Create Date: 09/20/2024 03:32:07 AM
// Design Name: 
// Module Name: riscv_definitions
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
package riscv_definitions;
    typedef enum logic [3:0] {
        ALU_ADD = 4'b0000,
        ALU_SUB = 4'b0001,
        ALU_AND = 4'b0010,
        ALU_OR = 4'b0011,
        ALU_XOR = 4'b0100,
        ALU_SLT = 4'b0101,
        ALU_SLL = 4'b0110,
        ALU_SRL = 4'b0111,
        ALU_SRA = 4'b1000
    } alu_ops_t;
endpackage
