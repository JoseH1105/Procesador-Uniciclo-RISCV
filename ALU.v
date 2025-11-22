// ===========================================================
//  ALU for RISC-V32I Processor
// ===========================================================

`timescale 1ns / 1ps

module alu #(
    parameter XLEN = 32
)(
    input  wire [XLEN-1:0] a,        // Operando A
    input  wire [XLEN-1:0] b,        // Operando B
    input  wire [3:0]      alu_ctrl, // Señal de control de la ALU
    output reg  [XLEN-1:0] result,   // Resultado de la operación
    output wire            zero      // Flag: resultado == 0
);

    // Señales internas
    wire signed [XLEN-1:0] a_signed = a;
    wire signed [XLEN-1:0] b_signed = b;

    // Lógica combinacional
    always @(*) begin
        case (alu_ctrl)
            4'b0000: result = a + b;                            // ADD
            4'b0001: result = a - b;                            // SUB
            4'b0010: result = a & b;                            // AND
            4'b0011: result = a | b;                            // OR
            4'b0100: result = a ^ b;                            // XOR
            4'b0101: result = a << b[4:0];                      // SLL
            4'b0110: result = a >> b[4:0];                      // SRL (lógico)
            4'b0111: result = a_signed >>> b[4:0];              // SRA (aritmético)
            4'b1000: result = (a_signed < b_signed) ? 32'd1 : 32'd0; // SLT signed
            4'b1001: result = (a < b) ? 32'd1 : 32'd0;          // SLTU unsigned
            default: result = 32'd0;                            // NOP / por defecto
        endcase
    end

    // Bandera de cero
    assign zero = (result == 0);

endmodule
