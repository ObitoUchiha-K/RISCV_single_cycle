module PC_flipflop (clk, pc_in, pc_out); 
input clk ;
input [31:0]pc_in;
output reg  [31:0]pc_out;
reg [31:0]count = 0;
always@ (posedge clk) begin
if(count == 0) pc_out = 0;
else pc_out = pc_in ;
count = count+1; 
end
endmodule	