//RTL Model for Linear Feedback Shift Register
module lfsr
#(parameter N = 4) // Number of bits for LFSR
(
  input logic clk, reset, load_seed,
  input logic[N-1:0] seed_data,
  output logic lfsr_done,
  output logic[N-1:0] lfsr_data
);

// N = 2, Poly: X^2 + X^1 + 1
	// XOR Out = lsfr_data[1] ^ lsft_data[0]
// N = 3, Poly: X^3 + X^2 + 1
	// XOR Out = lsfr_data[2] ^ lsft_data[1]
// N = 4, Poly: X^4 + X^3 + 1
	// XOR Out = lsfr_data[3] ^ lsft_data[2]
// N = 5, Poly: X^5 + X^3 + 1	
	// XOR Out = lsfr_data[4] ^ lsft_data[2]
// N = 6, Poly: X^6 + X^5 + 1	
	// XOR Out = lsfr_data[5] ^ lsft_data[4]
// N = 7, Poly: X^7 + X^6 + 1	
	// XOR Out = lsfr_data[6] ^ lsft_data[5]
// N = 8, Poly: X^8 + X^6 + X^5 + X^4 + 1
	// XOR Out = lsfr_data[7] ^ lsft_data[5] ^ lsfr_data[4] ^ lsft_data[3]
	
endmodule: lfsr
