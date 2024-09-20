//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alexander Michalak
// 
// Create Date: 09/20/2024 03:34:24 AM
// Design Name: 
// Module Name: alu_tb
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

module alu_tb;
    // Testbench signals
    logic [31:0] operand_a;
    logic [31:0] operand_b;
    alu_ops_t    alu_op;
    logic [31:0] result;
    logic        zero;
    
    // Instantiate the ALU
    alu dut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_op(alu_op),
        .result(result),
        .zero(zero)
    );
    
    // Test procedure
    initial begin
        // Test ADD operation
        operand_a = 32'd10;
        operand_b = 32'd15;
        alu_op = ALU_ADD;
        #10;
        $display("ADD Test: %0d + %0d = %0d", operand_a, operand_b, result);
        assert(result == 32'd25) else $error("ADD operation failed");
        
        // Test SUB operation
        operand_a = 32'd20;
        operand_b = 32'd5;
        alu_op = ALU_SUB;
        #10;
        $display("SUB Test: %0d - %0d = %0d", operand_a, operand_b, result);
        assert(result == 32'd15) else $error("SUB operation failed");
        
        // Test AND operation
        operand_a = 32'hFF00FF00;
        operand_b = 32'h0F0F0F0F;
        alu_op = ALU_AND;
        #10;
        $display("AND Test: %h & %h = %h", operand_a, operand_b, result);
        assert(result == (operand_a & operand_b)) else $error("AND operation failed");
        
        // Test OR operation
        operand_a = 32'hFF00FF00;
        operand_b = 32'h0F0F0F0F;
        alu_op = ALU_OR;
        #10;
        $display("OR Test: %h | %h = %h", operand_a, operand_b, result);
        assert(result == (operand_a | operand_b)) else $error("OR operation failed");
        
        // Test XOR operation
        operand_a = 32'hAA55AA55;
        operand_b = 32'h55AA55AA;
        alu_op = ALU_XOR;
        #10;
        $display("XOR Test: %h ^ %h = %h", operand_a, operand_b, result);
        assert(result == (operand_a ^ operand_b)) else $error("XOR operation failed");
        
        // Test SLT operation
        operand_a = 32'd10;
        operand_b = 32'd20;
        alu_op = riscv_definitions::ALU_SLT;
        #10;
        $display("SLT Test: %0d < %0d = %0d", operand_a, operand_b, result);
        assert(result == 32'd1) else $error("SLT operation failed");
        
        // Test SLL operation
        operand_a = 32'h00000001;
        operand_b = 32'd4;
        alu_op = ALU_SLL;
        #10;
        $display("SLL Test: %h << %0d = %h", operand_a, operand_b[4:0], result);
        assert(result == (operand_a << operand_b[4:0])) else $error("SLL operation failed");
        
        // Test SRL operation
        operand_a = 32'hF0000000;
        operand_b = 32'd4;
        alu_op = ALU_SRL;
        #10;
        $display("SRL Test: %h >> %0d = %h", operand_a, operand_b[4:0], result);
        assert(result == (operand_a >> operand_b[4:0])) else $error("SRL operation failed");
        
        // Test SRA operation
        operand_a = 32'hF0000000;
        operand_b = 32'd4;
        alu_op = ALU_SRA;
        #10;
        $display("SRA Test: %h >>> %0d = %h", operand_a, operand_b, result);
        assert($signed(result) == ($signed(operand_a) >>> operand_b[4:0])) else $error("SRA operation failed");
        
        $finish;
    end
endmodule
