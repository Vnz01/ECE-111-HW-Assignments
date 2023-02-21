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

module clock_divider_by_3(
  input logic clkin,    // input clock signal
  input logic reset,   // synchronous reset signal
  output logic clkout  // output clock signal
);

  // counter to divide clock by 3
  logic [1:0] count;

  always_ff @(posedge clkin, negedge reset) begin
    if (reset == 0) begin
      // reset counter to 0
      count <= 2'b00;
      clkout <= 0;
    end else begin
      // increment counter on each rising edge of input clock
      count <= count + 1;
      if (count == 2'b10) begin
        // output clock signal when counter reaches 2 (i.e. divide by 3)
        clkout <= ~clkout;
      end
    end
  end

endmodule
