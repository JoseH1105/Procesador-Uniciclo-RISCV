module mux2 #(parameter W = 32)(
    input  wire [W-1:0] a,   // opción 0
    input  wire [W-1:0] b,   // opción 1
    input  wire         sel, // 0 -> a, 1 -> b
    output wire [W-1:0] y
);
    assign y = sel ? b : a;
endmodule
