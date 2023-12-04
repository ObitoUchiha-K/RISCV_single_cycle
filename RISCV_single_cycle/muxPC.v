module mux_pc(pc_in, aluout, pc_plus4_out, pcmux_sel);
parameter datalength=32;
output reg  [datalength-1:0]pc_in;
input     [datalength-1:0]aluout,pc_plus4_out;
input      pcmux_sel;
always@(pcmux_sel,aluout,pc_plus4_out) begin
  pc_in = (pcmux_sel)?aluout:pc_plus4_out;
  end
endmodule

