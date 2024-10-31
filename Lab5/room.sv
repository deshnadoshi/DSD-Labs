// Room FSM

module room (input logic clk, n, s, e, w, v, reset, 
					output logic s6, win, s5, d, s4, s3, sw, s2, s1, s0); 


// Variables
logic s0_next, s1_next, s2_next, s3_next, s4_next, s5_next, s6_next, win_next, sw_next, d_next;


always begin 

	if (reset) begin 
        {s1_next, s2_next, s3_next, s4_next, s5_next, s6_next, win_next, sw_next, d_next} = 9'b0;
        s0_next = 1'b1;  // Reset defaults to s0
		  
	end else begin 
		// S0' Equation 
		s0_next = ((~reset & w & s1) | (s0 & ~s1_next & ~s2_next & ~s3_next & ~s4_next & ~s5_next & ~s6_next)); 
		
		// S1' Equation 
		s1_next = ((~reset & e & s0) | (~reset & n & s2)| (s1 & ~s0_next & ~s2_next & ~s3_next & ~s4_next & ~s5_next & ~s6_next)); 
				
		// S2' Equation
		s2_next = ((~reset & s & s1) | (~reset & e & s3) | (s2 & ~s1_next & ~s3_next & ~s4_next & ~s5_next & ~s6_next)); 

		// S3' Equation 
		s3_next = ((~reset & w & s2) | (s3 & ~s0_next & ~s1_next & ~s2_next & ~s4_next & ~s5_next & ~s6_next)); 

		// S4' Equation 
		s4_next = (~reset & s & e & s2); // Modified for Dragon's Den being SE from Rapid River

		// S5' Equation
		s5_next = (~reset & v & s4) | (s5); 
		
		// S6' Equation 
		s6_next = (~reset & ~v & s4) | (s6); 

		// WIN Equation 
		win_next = (~reset & s5) | (win); // Victory Vault is S5

		// SW Equation 
		sw_next = (~reset & s3) | (sw); 

		// D Equation 
		d_next = (~reset & s6) | (d); // Grievous Graveyard is S6
	
	
	end 
	
end 



d_ff d_ff_s6 (
	.d(s6_next), 
	.clk(clk), 
	.q(s6)
); 

d_ff d_ff_s5 (
	.d(s5_next), 
	.clk(clk), 
	.q(s5)
); 

d_ff d_ff_s4 (
	.d(s4_next), 
	.clk(clk), 
	.q(s4)
); 

d_ff d_ff_s3 (
	.d(s3_next), 
	.clk(clk), 
	.q(s3)
); 

d_ff d_ff_s2 (
	.d(s2_next), 
	.clk(clk), 
	.q(s2)
); 

d_ff d_ff_s1 (
	.d(s1_next), 
	.clk(clk), 
	.q(s1)
); 

d_ff d_ff_s0 (
	.d(s0_next), 
	.clk(clk), 
	.q(s0)
);

d_ff d_ff_win (
	.d(win_next), 
	.clk(clk), 
	.q(win)
); 

d_ff d_ff_sw (
	.d(sw_next), 
	.clk(clk), 
	.q(sw)
); 

d_ff d_ff_d (
	.d(d_next), 
	.clk(clk), 
	.q(d)
); 

					
endmodule


