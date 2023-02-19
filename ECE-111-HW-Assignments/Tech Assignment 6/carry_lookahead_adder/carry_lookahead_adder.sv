`include "fulladder.sv"
module carry_lookahead_adder#(parameter N=4)(
  input logic[N-1:0] A, B,
  input logic CIN,
  output logic[N:0] result
);
  
  logic [N-1:0] gen;
  logic [N-1:0] prop;
  logic [N-1:0] sum;
  logic [N:0] car;
  assign car[0] = CIN;
  
  genvar i;
  generate
    for (i=0; i<N; i++) begin
      assign prop[i] = A[i] ^ B[i];
      assign gen[i] = A[i] & B[i];
      fulladder fa ((.a(A[i])),(.b(B[i])),(.cin(car[i])),(.sum([i])),(.cout()))
    end
  endgenerate
    
  assign result = {car[N], sum};
 
endmodule: carry_lookahead_adder

