module wbmux(dmem_out,aluout,pc_plus4_out,wbmux_sel,wb_out);
input [31:0]dmem_out,aluout,pc_plus4_out;
input [1:0]wbmux_sel;
output reg [31:0]wb_out;
always@(aluout,dmem_out,pc_plus4_out,wbmux_sel) begin
case(wbmux_sel) 
2: wb_out = pc_plus4_out;
1: wb_out = aluout;
0: wb_out = dmem_out;
endcase
end
endmodule