//clock divide by 3 RTL code
module clock_divide_by_3 ( 
 input  logic clkin, reset,
 output logic clkout);

 // Add clock divide by 3 code
 always @(posedge clkin)
  if (reset == 1) 
   clkout <= 0;
 else begin
  ctr++;
  if (ctr == 2) begin
  ctr <= 0;
   ctr <= ~ctr;
  end
 end

endmodule: clock_divide_by_3
