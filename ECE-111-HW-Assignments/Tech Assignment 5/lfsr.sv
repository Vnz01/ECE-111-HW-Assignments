//RTL Model for Linear Feedback Shift Register
module lfsr
#(parameter N = 4) // Number of bits for LFSR
(
  input logic clk, reset, load_seed,
  input logic[N-1:0] seed_data,
  output logic lfsr_done,
  output logic[N-1:0] lfsr_data
);
	
logic XOR_out;
logic cycles;
logic ctr;
 // reset block that operates at posedge of reset and sets the lsfr data from the seed data it also sets the cycles needed for a full cycle and a ctr 
// used in another block
always @ (posedge reset) begin
	if(load_seed == 1) begin
		lsfr_data = seed_data;
	end
	
	cycles = (2**N) - 1;
	ctr = 0;
end
// always block that uses cases to check for the N parameter and see how many ff to use.
always @ (posedge clk) begin
	case(N)
	 8'h02: begin
	 XOR_out = lsfr_data[1] ^ lsfr_data[0];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 8'h03: begin
	 XOR_out = lsfr_data[2] ^ lsfr_data[1];
		 lsfr_data[2] <= lsfr_data[1];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 8'h04: begin
	 XOR_out = lsfr_data[3] ^ lsfr_data[2];
		 lsfr_data[3] <= lsfr_data[2];
		 lsfr_data[2] <= lsfr_data[1];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 8'h05: begin
	 XOR_out = lsfr_data[4] ^ lsfr_data[2];
		 lsfr_data[4] <= lsfr_data[3];
		 lsfr_data[3] <= lsfr_data[2];
		 lsfr_data[2] <= lsfr_data[1];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 8'h06: begin
	 XOR_out = lsfr_data[5] ^ lsfr_data[4];
		 lsfr_data[5] <= lsfr_data[4];
		 lsfr_data[4] <= lsfr_data[3];
		 lsfr_data[3] <= lsfr_data[2];
		 lsfr_data[2] <= lsfr_data[1];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 8'h07: begin
	 XOR_out = lsfr_data[6] ^ lsfr_data[5];
		 lsfr_data[6] <= lsfr_data[5];
		 lsfr_data[5] <= lsfr_data[4];
		 lsfr_data[4] <= lsfr_data[3];
		 lsfr_data[3] <= lsfr_data[2];
		 lsfr_data[2] <= lsfr_data[1];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 8'h08: begin
	 XOR_out = lsfr_data[7] ^ lsfr_data[5] ^ lsfr_data[4] ^ lsfr_data[3];
		 lsfr_data[7] <= lsfr_data[6];
		 lsfr_data[6] <= lsfr_data[5];
		 lsfr_data[5] <= lsfr_data[4];
		 lsfr_data[4] <= lsfr_data[3];
		 lsfr_data[3] <= lsfr_data[2];
		 lsfr_data[2] <= lsfr_data[1];
		 lsfr_data[1] <= lsfr_data[0];
	 end
	 default: begin
	 XOR_out = 0;
   	 end
	endcase
// increments ctr until the amount of cycles in which then it will set lsfr done to lsfr data
ctr++;
lsfr_data[0] <= XOR_out;
	
if (cycles == ctr) begin
lsfr_done <= lsfr_data[N-1:0];
ctr = 0;
end

end
endmodule: lfsr
