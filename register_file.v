module register_file #(parameter W=8) (input clk,reset,WE,input [2:0] A1,A2,A3,input [W-1:0] data,PC,output reg [W-1:0] RD1,RD2);

reg [W-1:0] R0,R1,R2,R3,R4,R5,R6,R7;

initial begin
R0=32'hA1;
R1=32'h98;
R2=32'h32;
R3=32'h7D;
R4=32'h45;
R5=0;
R6=32'h78;
end

always@(*)
begin

	case(A1)
	0: RD1=R0;
	1: RD1=R1;
	2: RD1=R2;
	3: RD1=R3;
	4: RD1=R4;
	5: RD1=R5;
	6: RD1=R6;
	7: RD1=R7;
	endcase
	
	case(A2)
	0: RD2=R0;
	1: RD2=R1;
	2: RD2=R2;
	3: RD2=R3;
	4: RD2=R4;
	5: RD2=R5;
	6: RD2=R6;
	7: RD2=R7;
	endcase
end

always@(posedge clk)
begin
	if(WE)
		case(A3)
		0: R0<=data;
		1: R1<=data;
		2: R2<=data;
		3: R3<=data;
		4: R4<=data;
		5: R5<=data;
		6: R6<=data;
		endcase
	R7<=PC;
end
	
endmodule