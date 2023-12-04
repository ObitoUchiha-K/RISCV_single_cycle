module alumux1(rs1_out,pc_out,alumux1_sel,alumux1_out);
input [31:0]rs1_out,pc_out;
input alumux1_sel;
output reg [31:0]alumux1_out;
always@(alumux1_sel,rs1_out,pc_out) begin
case(alumux1_sel) 
1: alumux1_out = pc_out;
0: alumux1_out = rs1_out;
endcase
end
endmodule