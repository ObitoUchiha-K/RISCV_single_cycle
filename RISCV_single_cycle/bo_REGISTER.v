module bo_REGISTER (clk,inst, regfilemux_sel, wb_out, rs1_out, rs2_out );
input [31:0]inst;
input [31:0]wb_out;
input  regfilemux_sel ;
input clk;
output  [31:0]rs1_out;
output  [31:0]rs2_out;
reg [31:0] Register [31:0];
always@(posedge clk) begin
   if(regfilemux_sel == 1'b1)
   Register[inst[11:7]] <= wb_out;
end
assign  rs1_out = (inst[19:15]!=0)? Register[inst[19:15]]:0;
assign  rs2_out = (inst[24:20]!=0)? Register[inst[24:20]]:0;
endmodule
