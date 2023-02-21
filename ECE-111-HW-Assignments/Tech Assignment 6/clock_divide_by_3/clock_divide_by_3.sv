module clock_divide_by_3( 
  input  logic clkin, reset,
  output logic clkout);

 logic cnt;
 logic ctr, rctr;

 //posedge clk that uses mod 3 counter and send the data to the or gate
 always_ff@(posedge clkin, posedge reset) begin
  if (reset == 1) begin
     cnt <= 0;
  end
  else begin
   if(cnt == 2) begin
        ctr <= 1;
	cnt <= 0;
   end  
   else begin
     cnt = cnt + 1;
   end
  end
 end

 
 // negedge clock that creates d flip flop in else begin statment 
always_ff@(negedge clkin, posedge reset) begin
     if (reset == 1) begin
     cnt <= 0;
   end
   else begin
     if (clkin) begin
	rctr <= ctr;
end
   end
 end
 
// clkout or gate
  assign clkout = (ctr || rctr);
endmodule: clock_divide_by_3
