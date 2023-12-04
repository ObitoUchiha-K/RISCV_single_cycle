module CLK_input();
reg clk,clkd;
wire pcmux_sel, regfilemux_sel,cmpop;
wire [31:0]pc_in,pc_out,pc_plus4_out,aluout,inst,wb_out,rs1_out,rs2_out;
wire [31:0]alumux1_out,alumux2_out,imm_out,dmem_out;
wire br_eq,br_lt,alumux1_sel,alumux2_sel,dmem_sel;
wire [5:0]addr;
wire [2:0]imm_sel;
wire [3:0]aluop;
wire [1:0]wbmux_sel;
wire [19:0] data;
wire [2:0]L_inst;
wire [1:0]S_inst;
//
assign {pcmux_sel,imm_sel,regfilemux_sel,cmpop,alumux2_sel,alumux1_sel,aluop,dmem_sel,S_inst,L_inst,wbmux_sel}=data;
mux_pc      u1(pc_in, aluout, pc_plus4_out, pcmux_sel);
PC_flipflop u2(clk, pc_in, pc_out); 
pc_add4     u3(pc_out,pc_plus4_out);
IMEM        u4(inst,pc_out);
address_decoder m1(inst,br_eq,br_lt, addr);
ROMcontrol      m2(data, addr);
bo_REGISTER u5(clk,inst, regfilemux_sel, wb_out, rs1_out, rs2_out );
ImmGen      u6(imm_sel, inst, imm_out);
branch_comp u7(rs1_out,rs2_out,cmpop,br_eq,br_lt);
alumux1     u8(rs1_out,pc_out,alumux1_sel,alumux1_out);
alumux2     u9(rs2_out,imm_out,alumux2_sel,alumux2_out);
alu         u10(alumux1_out,alumux2_out,aluop,aluout);
dmem        u11(clkd,aluout,rs2_out,dmem_sel,L_inst,S_inst, dmem_out);
wbmux       u12(dmem_out,aluout,pc_plus4_out,wbmux_sel,wb_out);
always begin
clk = 0;
clkd = 0;
#100 
clk = 1;
#10
clkd = 1;
#90;
end
endmodule