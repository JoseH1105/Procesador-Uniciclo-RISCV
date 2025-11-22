module mux_pc (
    input  wire [31:0] mentoReg, // entrada seleccionada con PCSrc=00
    input  wire [31:0] pc4,      // entrada seleccionada con PCSrc=01
    input  wire [31:0] pc_imm,   // entrada seleccionada con PCSrc=10
    input  wire [1:0]  sel,      // señal de selección PCSrc
    output reg  [31:0] pc_next   // salida del mux
);

    always @(*) begin
        case(sel)
            2'b00: pc_next = mentoReg;
            2'b01: pc_next = pc4;
            2'b10: pc_next = pc_imm;
            default: pc_next = 32'b0; // 11 o cualquier otro valor no usado
        endcase
    end

endmodule
