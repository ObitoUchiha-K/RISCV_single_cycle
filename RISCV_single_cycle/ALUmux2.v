module alumux2(rs2_out,imm_out,alumux2_sel,alumux2_out);
input [31:0]rs2_out,imm_out;
input alumux2_sel;
output reg [31:0]alumux2_out;
always@(alumux2_sel,rs2_out,imm_out) begin
case(alumux2_sel) 
1: alumux2_out = imm_out;
0: alumux2_out = rs2_out;
endcase
end
endmodule