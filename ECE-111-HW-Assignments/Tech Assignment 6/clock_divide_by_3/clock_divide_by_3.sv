//clock divide by 3 RTL code
module clock_divide_by_3 ( 
 input  logic clkin, reset,
 output logic clkout);
  
logic ctr = 0;

 // Add clock divide by 3 code
 always @(posedge clkin)
  if (reset == 1) 
   clkout <= 0;
 else begin
  ctr++;
  if ((ctr % 1) == 0) begin
   clkout <= ~clkout;
  end
 end

endmodule: clock_divide_by_3
