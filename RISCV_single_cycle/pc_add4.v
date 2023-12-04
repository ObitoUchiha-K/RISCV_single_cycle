module pc_add4(pc_out,pc_plus4_out);
input [31:0] pc_out;
output reg [31:0] pc_plus4_out;
always@(pc_out) begin
pc_plus4_out = pc_out + 4;
end
endmodule

