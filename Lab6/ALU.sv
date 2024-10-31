module ALU (
	input logic[31:0] SrcA, 
	input logic [31:0] SrcB, 
	input logic [2:0] ALUControl, 
	output logic[31:0] ALUResult
); 



always_comb begin
	ALUResult = 32'b0; 
	
	if (ALUControl == 3'b010) begin 
		ALUResult = SrcA + SrcB; 
	end
	else if (ALUControl == 3'b110) begin 
		ALUResult = SrcA - SrcB;
	end
end




endmodule
