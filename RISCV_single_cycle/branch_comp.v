module branch_comp (rs1_out,rs2_out,cmpop,br_eq,br_lt);
output reg br_eq,br_lt;
input  [31:0]rs1_out,rs2_out;
input cmpop;
always@(rs1_out,rs2_out,cmpop) begin
case(cmpop == 1) 
1:br_lt = (rs1_out<rs2_out)?1:0; // unsign
0:begin// sign
    br_eq=(rs1_out==rs2_out)?1:0; 
    if(rs1_out[31]==1 && rs2_out[31]==0) br_lt = 1;
	else if((rs1_out[31]==1 && rs2_out[31]==1)|(rs1_out[31]==0 && rs2_out[31]==0)) begin
	    if(rs1_out<rs2_out) br_lt=1;
		else br_lt=0;
	end
	else br_lt = 0;
  end
endcase
end
endmodule