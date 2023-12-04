module address_decoder (inst,br_eq,br_lt, addr);
parameter instwidth = 32;
parameter addrwidth = 6;
output reg [addrwidth-1:0]addr;
input      [instwidth-1:0]inst;
input br_eq,br_lt;
always@(inst,br_eq,br_lt) begin
case(inst[6:2]) 
    5'b01100: begin//R type
	     addr[5:4] = 0;
	     addr[3]= inst[14] & inst[13];
		 addr[2]= ~inst[13]&inst[14]|inst[13]&inst[12]&~inst[14];
		 addr[1]= ~inst[13]&inst[12]|inst[13]&~inst[12]&~inst[14];
		 addr[0]= ~inst[14]&inst[30]|inst[13]&~inst[12]&~inst[14]|inst[14]&inst[30]|inst[13]&inst[12]&inst[14]|~inst[13]&~inst[12]&inst[14];
		 end
    5'b00100: begin//I type
	     addr[5] = 0;
		 addr[4]= ~inst[13] & inst[12];
		 addr[3]= ~inst[12]|inst[13];
		 addr[2]= (~inst[12]|inst[13])&(inst[12]|inst[14]);
		 addr[1]= ~inst[14]&~inst[12]|inst[13]&inst[14]|inst[30]&inst[14]&inst[12];
		 addr[0]= inst[14]&~inst[12]&~inst[13]|inst[14]&~inst[30]&inst[12]|inst[14]&inst[12]&inst[13]|~inst[14]&~inst[12]&inst[13];
		 end
	5'b00000: begin //Load intrustion type
	     addr[5] = 0;
		 addr[4]= 1;
		 addr[3]= 0;
		 addr[2]= inst[12]|inst[13]|inst[14];
		 addr[1]= (~inst[12]|inst[13]|inst[14])&(inst[14]|inst[12]|~inst[13]);
		 addr[0]= (inst[14]|inst[13]|~inst[12])&(~inst[14]|inst[12]|inst[13]);
		 end 
	5'b01000: begin//Store instruction type
	     addr[5] = 0;
		 addr[4]= 1;
		 addr[3]= 1;
		 addr[2]= 0;
		 addr[1]= inst[13];
		 addr[0]= inst[12];
		 end
	5'b11000: begin//Branch type 
	    if(inst[14:12]<= 2) begin
	     addr[5] = 0;
		 addr[4]= 1;
		 addr[3]= 1;
		 addr[2]= inst[14]|inst[13]|inst[12]|~br_eq;
		 addr[1]= inst[13]|br_eq;
		 addr[0]= ~inst[12]&br_eq|inst[12]&~br_eq; 
		 end
		else begin
	     addr[5] = ~inst[14]|inst[13]|inst[12]|~br_lt;
		 addr[4]= inst[14]&~inst[13]&~inst[12]&br_lt;
		 addr[3]= inst[14]&~inst[13]&~inst[12]&br_lt;
		 addr[2]= (inst[13]&~inst[12]&~br_lt)|(inst[14]&inst[13]&inst[12])|(~inst[13]&~inst[12]&br_lt);
		 addr[1]= (~inst[12]|br_lt)&(inst[12]|br_lt);
		 addr[0]= (~inst[12]|~br_lt)&(inst[12]|br_lt);
		 end
		end
	//LUI va AUIPC instruction type
    5'b01101: addr = 6'd39;
	5'b00101: addr = 6'd40;
	//JUMP instruction type
	5'b11001: begin 
	     if(inst[14:12]==0) addr =41;
		 end 
	5'b11011: addr = 6'd42;
  endcase
end
endmodule