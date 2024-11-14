module MUX_ALUSrc(
input logic ALUSrc, 
input logic [31:0] RegB, 
input logic [31:0] Imm,
output logic [31:0] ALUSrc_out
); 

assign ALUSrc_out = ALUSrc ? Imm : RegB; 

endmodule
