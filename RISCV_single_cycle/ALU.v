module alu(alumux1_out,alumux2_out,aluop,aluout);
input signed [31:0]alumux1_out,alumux2_out;
input [3:0]aluop;
output reg [31:0]aluout;
reg [31:0]a,b;
always@(aluop,alumux1_out,alumux2_out) begin
case(aluop)
 4'b0000: aluout = ~(~alumux1_out+1 + ~alumux2_out+1)+1;
 4'b0001: aluout = ~(~alumux1_out- ~alumux2_out)+1;
 4'b0010: aluout = alumux1_out<<alumux2_out;
 4'b0011: begin
	if(alumux1_out[31]==1 && alumux2_out[31]==0) aluout = 1;
	else if((alumux1_out[31]==1 && alumux2_out[31]==1)||(alumux1_out[31]==0 && alumux2_out[31]==0)) begin
	    if(alumux1_out<alumux2_out) aluout = 1;
		else aluout = 0;
	end
	else aluout = 0;
	end
 4'b0100: begin
	    if(alumux1_out<alumux2_out) aluout = 1;
		else aluout = 0;
	 end
 4'b0101: aluout = alumux1_out^alumux2_out;
 4'b0110: aluout = alumux1_out>>alumux2_out;
 4'b0111: aluout = alumux1_out>>>alumux2_out;
 4'b1000: aluout = alumux1_out|alumux2_out;
 4'b1001: aluout = alumux1_out&alumux2_out;
 4'b1111: aluout = alumux2_out;
 endcase
 end
 endmodule
 