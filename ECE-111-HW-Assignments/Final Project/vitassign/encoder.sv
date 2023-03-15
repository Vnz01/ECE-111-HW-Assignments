module encoder
(  input             clk,
   input             rst,
   input             enable_i,
   input             d_in,
   output logic      valid_o,
   output      [1:0] d_out);
   
   logic         [2:0] cstate;
   logic         [2:0] nstate;
   logic         [1:0] d_out_reg;
   assign processed_in = d_in ^ cstate[1] ^ cstate[0];
   assign   d_out    =  (enable_i)? d_out_reg:2'b00;

   always_comb begin
      valid_o  =   enable_i;
      nstate = {processed_in,cstate[2:1]};
      d_out_reg = {processed_in ^ cstate[2] ^ cstate[0], d_in};
   end								   

   always @ (posedge clk,negedge rst)   begin
      if(!rst)
         cstate   <= 3'b000;
      else if(!enable_i)
         cstate   <= 3'b000;
      else
         cstate   <= nstate;
   end
endmodule
