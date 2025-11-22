module alusrc_muxes (
    input  wire [31:0] pc,     // para ALUSrcA
    input  wire [31:0] rd1,    // para ALUSrcA
    input  wire [31:0] rd2,    // para ALUSrcB
    input  wire [31:0] imm,    // para ALUSrcB (Extend)
    input  wire        selA,   // 0: pc,   1: rd1
    input  wire        selB,   // 0: rd2,  1: imm
    output wire [31:0] opA,
    output wire [31:0] opB
);
    // Reutilizamos tu mux2 parametrizable
    mux2 #(32) MUX_A (
    .a(pc),
    .b(rd1),
    .sel(selA),
    .y(opA)
);

mux2 #(32) MUX_B (
    .a(rd2),
    .b(imm),
    .sel(selB),
    .y(opB)
);

endmodule
