module gray_code_to_binary_convertor #(parameter N = 4)( 
  input logic clk, rstn, 
  input logic[N-1:0] gray_value,
  output logic[N-1:0] binary_value);
 
  always @ (posedge clock and posedge rstn)
    begin
      binary_value[N-1] = gray_value[N-1];
      binary_value[N-2:0] = gray_value[N-2:0] ^ binary_value[N-1:1];
    end

endmodule: gray_code_to_binary_convertor
