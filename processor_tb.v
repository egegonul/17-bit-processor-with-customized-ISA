module processor_tb();

	
reg	clk,run,reset;

wire	[7:0] ALU_out;
wire	[16:0] DR_out;
wire	[16:0] Instruction;
wire	[16:0] memory_out;
wire	[7:0] PC;
wire	[7:0] RD1;
wire	[7:0] RD2;
wire	[7:0] result;
wire	[7:0] SrcA;
wire	[7:0] SrcB;

datapath dut(
	clk,
	run,
	reset,
	ALU_out,
	DR_out,
	Instruction,
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
run=1; reset=0;
end

endmodule