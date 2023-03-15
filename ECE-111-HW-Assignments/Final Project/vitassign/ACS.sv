module ACS		                        // add-compare-select
(
   input       path_0_valid,
   input       path_1_valid,
   input [1:0] path_0_bmc,	            // branch metric computation
   input [1:0] path_1_bmc,				
   input [7:0] path_0_pmc,				// path metric computation
   input [7:0] path_1_pmc,

   output logic        selection,
   output logic        valid_o,
   output      [7:0] path_cost);  

   wire  [7:0] path_cost_0;			   // branch metric + path metric
   wire  [7:0] path_cost_1;

/* Fill in the guts per ACS instructions
*/

assign path_cost_0 = path_0_pmc + path_0_bmc;
assign path_cost_1 = path_1_pmc + path_1_bmc;

always_comb begin
	if (valid_o && selection) begin
		path_cost = path_cost_1;
	end else if (valid_o) begin
		path_cost = path_cost_0;
	end else if (selection) begin
		path_cost = 0;
	end else begin
		path_cost = 0;
	end
end

always_comb begin
	if (!path_0_valid && !path_1_valid) begin
		valid_o = 0;
	end else begin
		valid_o = 1;
	end
end

always_comb begin
	if (path_0_valid && path_1_valid) begin
		selection = 1;
	end else if (path_0_valid) begin
		selection = 0;
	end else if (path_1_valid) begin
		selection = 1;
	end else begin
		selection = 0;
	end
end
endmodule
