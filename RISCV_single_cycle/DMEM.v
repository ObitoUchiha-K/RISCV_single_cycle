module dmem(clkd,aluout,rs2_out,dmem_sel,L_inst,S_inst, dmem_out);
input [31:0]aluout,rs2_out;
input [2:0]L_inst;
input [1:0]S_inst;
input dmem_sel;
input clkd;
output reg [31:0]dmem_out;
reg [31:0]mem1[511:0];
reg [31:0]temp;
initial
begin
mem1[0] = 32'h00000000;
mem1[1] = 32'h00000001;
mem1[2] = 32'h00000002;
mem1[3] = 32'h00000003;
mem1[4] = 32'h00000004;
mem1[5] = 32'h00000005;
mem1[6] = 32'h00000006;
mem1[7] = 32'h00000007;
end
always @(posedge clkd)begin
if(dmem_sel == 1'b0)begin
  case(L_inst)
    3'b001 : begin
      if(mem1[aluout][7] == 1'b0)
        dmem_out <= {24'b000000000000000000000000, mem1[aluout][7:0]};
      else if(mem1[aluout][7] == 1'b1)
        dmem_out <= {24'b111111111111111111111111, mem1[aluout][7:0]};
    end

    3'b010 : begin
      if(mem1[aluout][15] == 1'b0)
        dmem_out <= {16'b0000000000000000, mem1[aluout][15:0]};
      else if(mem1[aluout][15] == 1'b1)
        dmem_out <= {16'b1111111111111111, mem1[aluout][15:0]};
    end
    
    3'b000 : dmem_out <= mem1[aluout];
    3'b101 : dmem_out <= {24'b000000000000000000000000,mem1[aluout][7:0]};
    3'b110 : dmem_out <= {16'b0000000000000000, mem1[aluout][15:0]};
  endcase
end
else if(dmem_sel == 1'b1)begin
  temp = rs2_out;
  case(S_inst)
    2'b01 : mem1[aluout] = {24'b000000000000000000000000, temp[7:0]};
    2'b10 : mem1[aluout] = {16'b0000000000000000, temp[15:0]};
    2'b00 : mem1[aluout] = temp;
  endcase
end
end
endmodule