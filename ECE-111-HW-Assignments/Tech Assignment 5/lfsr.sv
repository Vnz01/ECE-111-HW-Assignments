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

always @ (posedge clk) begin
	case(N)
	 4'b0010: begin
	 polynomial = x^2 + x^1 + 1;
	 end
	 4'b0011: begin
	 polynomial = x^3 + x^2 + 1;
	 end
	 4'b0100: begin
	 polynomial = x^4 + x^3 + 1;
	 end
	 4'b0101: begin
 	 polynomial = x^5 + x^3 + 1;
	 end
	 4'b0110: begin
 	 polynomial = x^6 + x^5 + 1;
	 end
	 4'b0111: begin
 	 polynomial = x^7 + x^6 + 1;
	 end
	 4'b1000: begin
 	 polynomial = x^8 + x^6 + x^5 + x^4 + 1;
	 end
	endcase

lsfr_data[0] <= XOR_out;

// N = 2, Poly: X^2 + X^1 + 1
	// XOR_out = lsfr_data[1] ^ lsft_data[0]
	// lsft_data[0] <= XOR_out
// N = 3, Poly: X^3 + X^2 + 1
	// XOR_out = lsfr_data[2] ^ lsft_data[1]
	// lsft_data[0] <= XOR_out
// N = 4, Poly: X^4 + X^3 + 1
	// XOR_out = lsfr_data[3] ^ lsft_data[2]
	// lsft_data[0] <= XOR_out
// N = 5, Poly: X^5 + X^3 + 1	
	// XOR_out = lsfr_data[4] ^ lsft_data[2]
	// lsft_data[0] <= XOR_out
// N = 6, Poly: X^6 + X^5 + 1	
	// XOR_out = lsfr_data[5] ^ lsft_data[4]
	// lsft_data[0] <= XOR_out
// N = 7, Poly: X^7 + X^6 + 1	
	// XOR_out = lsfr_data[6] ^ lsft_data[5]
	// lsft_data[0] <= XOR_out
// N = 8, Poly: X^8 + X^6 + X^5 + X^4 + 1
	// XOR_out = lsfr_data[7] ^ lsft_data[5] ^ lsfr_data[4] ^ lsft_data[3]
	// lsft_data[0] <= XOR_out
end
endmodule: lfsr
