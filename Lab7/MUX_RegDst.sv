module MUX_RegDst(
	input logic RegDst,
	input logic [4:0] rt, 
	input logic [4:0] rd,
	output logic [4:0] RegDst_out
); 

// R-type Instruction - 20:16
// I-type Instruction - 15:11


	assign RegDst_out = RegDst ? rd : rt; 

endmodule
