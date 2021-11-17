 module datapath_tb();
 
 reg mode;
 reg	ALUSrcA;
 reg	MemWrite;
 reg	RegWrite;
 reg	clk;
 reg	PCWrite;
 reg	[2:0] A1;
 reg [2:0] A2;
 reg	[2:0] A3;
 reg	[2:0] ALU_control;
 reg	[1:0] ALUSrcB;
 reg	[7:0] imm;
 reg	[1:0] ResultSrc;
 
 wire	[7:0] ALU_out;
 wire	[7:0] SrcA;
 wire	[7:0] SrcB;
 wire	[7:0] memory_out;
 wire [7:0] DR_out;
 wire	[7:0] PC;
 wire	[7:0] RD1;
 wire	[7:0] RD2;
 wire	[7:0] result;


 veri_datapath dut(
	mode,
	ALUSrcA,
	MemWrite,
	RegWrite,
	clk,
	PCWrite,
	A1,
	A2,
	A3,
	ALU_control,
	ALUSrcB,
	imm,
	ResultSrc,
	ALU_out,
	DR_out,
	memory_out,
	PC,
	RD1,
	RD2,
	result,
	SrcA,
	SrcB
);

always
begin
clk = 0; #5; clk = 1; #5;
end

initial begin


//DATA PROCESSING
//fetch cycle control inputs
PCWrite=1; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
#10;
//decode cycle control inputs
PCWrite=0; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
//fetch cycle datapath inputs
A1=1; A2=3; A3=2; 
#10;
//execute cycle
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b00; mode=0; ALU_control=1; MemWrite=0; RegWrite=0; ResultSrc=2'bxx;  
#10;
//writeback cycle
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b00; mode=0; ALU_control=1; MemWrite=0; RegWrite=1; ResultSrc=2'b00; 


//BRANCH


//fetch cycle control inputs
PCWrite=1; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
#10;
//decode cycle control inputs
PCWrite=0; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
//fetch cycle datapath inputs
A1=1; A2=3; A3=2; 
#10;

//branch cycle
PCWrite=1; ALUSrcA=0; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
imm=0;
#10;

//STR

//fetch cycle control inputs
PCWrite=1; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
#10;
//decode cycle control inputs
PCWrite=0; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
//fetch cycle datapath inputs
A1=1; A2=3; A3=2; 
#10;
//memaddr stage
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b01; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
#10;
//MemWrite stage
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b01; mode=0; ALU_control=0; MemWrite=1; RegWrite=0; ResultSrc=2'b10;  
imm=0;




//LDR

//fetch cycle control inputs
PCWrite=1; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
#10;
//decode cycle control inputs
PCWrite=0; ALUSrcA=1; ALUSrcB=2'b10; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
//fetch cycle datapath inputs
A1=1; A2=3; A3=2; 
#10;
//memaddr stage
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b00; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b10;  
#10;
// memread stage 
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b01; mode=0; ALU_control=0; MemWrite=0; RegWrite=0; ResultSrc=2'b00;  

//memwb stage
PCWrite=0; ALUSrcA=0; ALUSrcB=2'b01; mode=0; ALU_control=0; MemWrite=0; RegWrite=1; ResultSrc=2'b01; 



end


endmodule








