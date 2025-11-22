module adder_pcimm (
    input  wire [31:0] pc,
    input  wire [31:0] imm,   // inmediato ya extendido a 32 bits
    output wire [31:0] pc_imm
);
    assign pc_imm = pc + imm;
endmodule
