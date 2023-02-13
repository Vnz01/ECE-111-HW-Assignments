//RTL Model for Linear Feedback Shift Register
module lfsr
#(parameter N = 4) // Number of bits for LFSR
(
  input logic clk, reset, load_seed,
  input logic[N-1:0] seed_data,
  output logic lfsr_done,
  output logic[N-1:0] lfsr_data
);

//Guidance on translating polynomials to HW though pseudocodes below
//For N=4: polynomial is x^4+ x^3 + 1
//the corrresponding pseudo-code for XOR gate given below. Notice that the index used is one less than the equation
	//xor_output = lfsr_data[3] ^ lfsr_data[2];
	
//Another example, when N=5, the correponding polynomial is x^5 + x^3 + 1
//this polynomial will yield XOR hardware shown by pseudo code below
	//xor_output = lfsr_data[4] ^ lfsr_data[2];
	
//Note: We are tapping indexes which are one less than the exponent. This is because the numbering for the polynomial exponents starts from 1 and goes till N....whereas, the numbering convention we follow is starting from 0 going up to N-1. 


//student to add implementation for LFSR code below

endmodule: lfsr