module ImmGen (imm_sel, inst, imm_out);
input [31:0]inst;
input [2:0]imm_sel;
output reg [31:0]imm_out;
always@(inst,imm_sel) begin
    if (imm_sel == 3'b000) begin
	    if (inst[31] == 1'b0) begin
	    imm_out = {20'b00000000000000000000, inst[31:20]};
		end
	    else if (inst[31] == 1'b1) begin
		imm_out = {20'b11111111111111111111, inst[31:20]};
		end
	end
	if (imm_sel == 3'b001) begin
	    imm_out = {20'b00000000000000000000, inst[31:20]};
    end 
    if (imm_sel == 3'b010) begin		
	    imm_out = {27'b000000000000000000000000000, inst[24:20]};
	end
	if (imm_sel == 3'b011) begin
        if (inst[31] == 1'b0) begin
	    imm_out = {20'b00000000000000000000, inst[31:25],inst[11:7]};
		end
	    else if (inst[31] == 1'b1) begin
		imm_out = {20'b11111111111111111111, inst[31:25],inst[11:7]};
		end
	end
	if (imm_sel == 3'b100) begin
	    if (inst[31] == 1'b0) begin
	    imm_out = {19'b0000000000000000000, inst[31],inst[7],inst[30:25], inst[11:8], 1'b0};
		end
	    else if (inst[31] == 1'b1) begin
		imm_out = {19'b1111111111111111111, inst[31],inst[7],inst[30:25], inst[11:8], 1'b0};
		end
	end
	if (imm_sel == 3'b101) begin
	    imm_out = {inst[31:12], 12'b000000000000};
	end
	if (imm_sel == 3'b110) begin
	    if (inst[31] == 1'b0) begin
	    imm_out = {11'b00000000000, inst[31],inst[19:12],inst[20], inst[30:21], 1'b0};
		end
	    else if (inst[31] == 1'b1) begin
		imm_out = {11'b11111111111, inst[31],inst[19:12],inst[20], inst[30:21], 1'b0};
		end
	end

end
endmodule
