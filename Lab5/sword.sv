// Sword FSM

module sword (input logic sw, reset, clk, 
					output logic v); 

// Variables
logic v_next;

always begin 

	if (reset) begin 
		
		v_next = 1'b0; 
		
	end else begin 
		// V Equation
		v_next = ((~reset & sw) | (v)); 
	
	end 

end 

d_ff d_ff_v (
	.d(v_next), 
	.clk(clk), 
	.q(v)
); 

endmodule