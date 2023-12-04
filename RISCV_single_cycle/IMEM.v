/*
 ***@Author: NGUYEN TRUNG HIEU
 ***@Date:   Nov 1st, 2018
*/

/******** Instruction Memmory Block ********/
module IMEM(inst,pc_out);
parameter	INST_WIDTH_LENGTH = 32;
parameter	PC_WIDTH_LENGTH = 32;
parameter	MEM_WIDTH_LENGTH = 32;
parameter	MEM_DEPTH = 1<<18;
output	reg	[INST_WIDTH_LENGTH-1:0]inst;
input		[PC_WIDTH_LENGTH-1:0]pc_out;

/********* Instruction Memmory *************/
reg		[MEM_WIDTH_LENGTH-1:0]IMEM[0:MEM_DEPTH-1];

wire		[17:0]pWord;
wire		[1:0]pByte;

assign		pWord = pc_out[19:2];
assign		pByte = pc_out[1:0];

initial begin
$readmemh("testcode.txt",IMEM);
end
always@(pc_out)
begin
	if (pByte == 2'b00)
		inst <= IMEM[pWord];
	else
		inst <= 'hz;
end

endmodule
