module register_file(input logic clk, rst, 
		input logic[4:0] A1, A2, A3, // A1, A2, A3 are the addresses
		input logic[31:0] WD3, // data from data memory
		input logic WE3, // WE3 = 1, write register file
		output logic[31:0] RD1, // Output port one for register file
		output logic[31:0] RD2, // Output port two for register file
		output logic[31:0] prode // prode to check the result in the register file
); 


logic[31:0] rf_regs[31:0];

assign prode = rf_regs[A3];

assign RD1 = rf_regs[A1]; 
assign RD2 = rf_regs[A2];


always_ff @ (posedge clk or negedge rst)
begin 
	if (!rst) begin 
		for (int i = 0; i < 32; i++) begin 
			rf_regs[i] <= i;
		end 
	end
	else begin 
		if (WE3) begin 
			rf_regs[A3] <= WD3; // Write WD3 to the memory address A3, if WE3 is high
		end
	end


end



endmodule
