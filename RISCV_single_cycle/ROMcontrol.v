module ROMcontrol (data, addr);
parameter addrwidth = 6;
parameter datawidth = 20;
output reg [datawidth-1:0]data;
input      [addrwidth-1:0]addr;
always@(addr)
begin
  case(addr)
    //R type
    6'd0 : data=20'b0_000_1_0_0_0_0000_0_00_000_01;
    6'd1 : data=20'b0_000_1_0_0_0_0001_0_00_000_01;   
    6'd2 : data=20'b0_000_1_0_0_0_0010_0_00_000_01;
    6'd3 : data=20'b0_000_1_0_0_0_0011_0_00_000_01;
    6'd4 : data=20'b0_000_1_0_0_0_0100_0_00_000_01;
    6'd5 : data=20'b0_000_1_0_0_0_0101_0_00_000_01;
    6'd6 : data=20'b0_000_1_0_0_0_0110_0_00_000_01;
    6'd7 : data=20'b0_000_1_0_0_0_0111_0_00_000_01;
    6'd8 : data=20'b0_000_1_0_0_0_1000_0_00_000_01;
    6'd9 : data=20'b0_000_1_0_0_0_1001_0_00_000_01;
    
    //I type
    6'd10 : data=20'b0_000_1_0_1_0_0000_0_00_000_01;
    6'd11 : data=20'b0_000_1_0_1_0_0011_0_00_000_01;
    6'd12 : data=20'b0_001_1_0_1_0_0100_0_00_000_01;
    6'd13 : data=20'b0_000_1_0_1_0_0101_0_00_000_01;
    6'd14 : data=20'b0_000_1_0_1_0_1000_0_00_000_01;
    6'd15 : data=20'b0_000_1_0_1_0_1001_0_00_000_01;
    6'd16 : data=20'b0_010_1_0_1_0_0010_0_00_000_01;
    6'd17 : data=20'b0_010_1_0_1_0_0110_0_00_000_01;
    6'd18 : data=20'b0_010_1_0_1_0_0111_0_00_000_01;
    
    //Load intrustion type
    6'd19 : data=20'b0_000_1_0_1_0_0000_0_00_001_00;
    6'd20 : data=20'b0_000_1_0_1_0_0000_0_00_010_00;
    6'd21 : data=20'b0_000_1_0_1_0_0000_0_00_000_00;
    6'd22 : data=20'b0_000_1_0_1_0_0000_0_00_101_00;
    6'd23 : data=20'b0_000_1_0_1_0_0000_0_00_110_00;
    
    //Store instruction type
    6'd24 : data=20'b0_011_0_0_1_0_0000_1_01_000_00;
    6'd25 : data=20'b0_011_0_0_1_0_0000_1_10_000_00;
    6'd26 : data=20'b0_011_0_0_1_0_0000_1_00_000_00;
    
    //Branch type
    6'd27 : data=20'b1_100_0_0_1_1_0000_0_00_000_00;
    6'd28 : data=20'b0_100_0_0_1_1_0000_0_00_000_00;
    
    6'd29 : data=20'b1_100_0_0_1_1_0000_0_00_000_00;
    6'd30 : data=20'b0_100_0_0_1_1_0000_0_00_000_00;
    
    6'd31 : data=20'b1_100_0_0_1_1_0000_0_00_000_00;
    6'd32 : data=20'b0_100_0_0_1_1_0000_0_00_000_00;
    
    6'd33 : data=20'b1_100_0_0_1_1_0000_0_00_000_00;
    6'd34 : data=20'b0_100_0_0_1_1_0000_0_00_000_00;

    6'd35 : data=20'b1_100_0_1_1_1_0000_0_00_000_00;
    6'd36 : data=20'b0_100_0_1_1_1_0000_0_00_000_00;
    
    6'd37 : data=20'b1_100_0_1_1_1_0000_0_00_000_00;
    6'd38 : data=20'b0_100_0_1_1_1_0000_0_00_000_00;
    
    //LUI va AUIPC instruction type
    6'd39 : data=20'b0_101_1_0_1_0_1111_0_00_000_01;
    6'd40 : data=20'b0_101_1_0_1_1_0000_0_00_000_01;
    
    //JUMP instruction type
    6'd41 : data=20'b1_000_1_0_1_0_0000_0_00_000_10;
    6'd42 : data=20'b1_110_1_0_1_1_0000_0_00_000_10;


endcase
end
endmodule

