module clock_divide_by_3( 
  input  logic clkin, reset,
  output logic clkout);

 logic [1:0] ctr, rctr;

  // ctr is posedge counter that resets when it is equal to 2 on posedge of clkin
 always_ff@(posedge clkin) begin
  if (reset) begin
  	ctr <= 0;
  end
  else if(ctr == 2) begin
  	ctr <= 0;
  end  
  else begin
  	ctr <= ctr + 1;
  end
  end

  // rctr is a negedge counter that resets when it is equal to 2 on negedge of clkin
 always_ff@(negedge clkin) begin
  if (reset) begin
  	rctr <= 0;
  end
  else if(rctr == 2) begin
  	rctr <= 0;
  end  
  else begin
  	rctr <= rctr + 1;
  end
  end
 // is returns the output clock to 1 when either ctr or rctr is 2
  assign clkout = ((ctr == 2)|(rctr == 2));

endmodule: clock_divide_by_3
 
