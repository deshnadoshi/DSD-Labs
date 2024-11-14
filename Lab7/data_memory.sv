module data_memory(
input logic clk, rst, 
input logic [31:0] A, // address
input logic [31:0] WD, // input data
input logic WE, // enable input
output logic [31:0] RD, 
output logic [31:0] prode // to check the data in data memory
); 

logic [31:0] mem [255:0];

assign RD = mem[A[7:0]];
assign prode = mem[A[7:0]]; 

always_ff @(posedge clk or negedge rst)
begin 
	if (!rst) begin 
		for (int i = 0; i < 256; i++) begin 
			mem[i] <= i; 
		end
	end
	else if (WE) begin
		mem[A[7:0]] <= WD; 
	end

end


endmodule
