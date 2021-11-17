module controller(input clk,run,reset,Z,CO, input [1:0] op, input [3:0] funct,
 output PCReset,PCWrite,IRWrite,RegWrite,MemWrite, output reg AdrSrc,mode, output reg [1:0] ALUSrcA,ALUSrcB,RegSrc,ResultSrc, output reg [2:0] ALUControl,output [3:0] state);
 
reg[3:0] CS,NS;
reg zero,carry;
//parameter fetch=0,decode=1,dp_execute=2,dp_writeback=3,mem_adr=4,imm address=9,memread=5,mem_wb=6,memwrite=7,branch=8;
initial begin
ALUControl=0;
CS=0;
AdrSrc=0;
mode=0;
ALUSrcA=0;
ALUSrcB=0;
RegSrc=0;
ResultSrc=0;
end

always @(posedge clk)
begin
	if(reset)
		CS<=0;
	else if(CS==0)
		if(run)
			CS<=NS;
		else
			CS<=CS;
	else
		CS<=NS;
	
end

// next state generation
always @(*)
	case(CS)
	0: NS=1;
	1: if(op==0) NS=2; 
		else if(op==1) begin
			if(funct[3]) NS=9;
			else NS=4; end
		else if(op==2) NS=8;
	2: NS=3;
	3: NS=0;
	4: if(funct[3]) NS=5; else if(~funct[3]) NS=7;
	5: NS=6;
	6: NS=0;
	7: NS=0;
	8: NS=0;
	9: NS=0;
	endcase

// enable signals 

assign PCReset=reset;
assign PCWrite=((CS==0)&run )|(CS==1)|(CS==8);
assign IRWrite=(CS==1);
assign RegWrite=(CS==3)|(CS==6)|((CS==8)&(funct[3:1]==1));
assign MemWrite=(CS==7);
assign state=CS;

//select signals

always @(*)
	case(CS)
	0: if(run) begin AdrSrc=0; ALUSrcA=2'b01; ALUSrcB=2'b10; ResultSrc=2'b10; end
	1: begin ALUSrcA=2'b01; ALUSrcB=2'b10; ResultSrc=2'b10; end
	2: begin ALUSrcA=0; ALUSrcB=2'b00; ALUControl=funct[2:0]; mode=funct[3]; zero=Z; carry=CO; end
	3: begin ResultSrc=2'b00; end
	4: begin ALUSrcA=2'b10; ALUSrcB=2'b01; mode=0; ALUControl=3'b000; end
	5: begin ResultSrc=2'b00; AdrSrc=1; end
	6: begin ResultSrc=2'b01; end
	7: begin ResultSrc=2'b00; AdrSrc=1; end
	8: case(funct[3:1])
	// branch conditions
		0: begin ALUSrcA=2'b10; ALUSrcB=2'b01; ResultSrc=2'b10; end
		1: begin ALUSrcA=2'b10; ALUSrcB=2'b01; ResultSrc=2'b10; end
		2: begin ALUSrcA=2'b00; ALUSrcB=2'b01; ResultSrc=2'b10; end
		3: if(zero) begin ALUSrcA=2'b10; ALUSrcB=2'b01; ResultSrc=2'b10; end
		4: if(~zero) begin ALUSrcA=2'b10; ALUSrcB=2'b01; ResultSrc=2'b10; end
		5: if(carry) begin ALUSrcA=2'b10; ALUSrcB=2'b01; ResultSrc=2'b10; end
		6: if(~carry) begin ALUSrcA=2'b10; ALUSrcB=2'b01; ResultSrc=2'b10; end
		endcase 
	9: begin ALUSrcA=2'b10; ALUSrcB=2'b01; mode=0; ALUControl=3'b000; ResultSrc=2'b10; end
	endcase

	




endmodule
