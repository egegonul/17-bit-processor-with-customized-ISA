

module datapath(
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


input wire	clk;
input wire	run;
input wire	reset;
output wire	[7:0] ALU_out;
output wire	[16:0] DR_out;
output wire	[16:0] Instruction;
output wire	[16:0] memory_out;
output wire	[7:0] PC;
output wire	[7:0] RD1;
output wire	[7:0] RD2;
output wire	[7:0] result;
output wire	[7:0] SrcA;
output wire	[7:0] SrcB;

wire	AdrSrc;
wire	[2:0] ALUControl;
wire	[1:0] ALUSrcA;
wire	[1:0] ALUSrcB;
wire	CO;
wire	[16:0] datar;
wire	[16:0] instr;
wire	IRWrite;
wire	MemWrite;
wire	mode;
wire	PCReset;
wire	PCWrite;
wire	RegWrite;
wire	[7:0] res;
wire	[1:0] ResultSrc;
wire	vcc;
wire	[16:0] wdata;
wire	Z;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	[16:0] SYNTHESIZED_WIRE_16;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_17;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_14;

assign	ALU_out = SYNTHESIZED_WIRE_15;
assign	memory_out = SYNTHESIZED_WIRE_16;
assign	PC = SYNTHESIZED_WIRE_17;
assign	RD1 = SYNTHESIZED_WIRE_14;
assign	RD2 = SYNTHESIZED_WIRE_5;
assign	SrcA = SYNTHESIZED_WIRE_3;
assign	SrcB = SYNTHESIZED_WIRE_4;




reg2	b2v_Alu_buffer(
	.clk(clk),
	
	.WE(vcc),
	.data(SYNTHESIZED_WIRE_15),
	.RD(SYNTHESIZED_WIRE_10));
	defparam	b2v_Alu_buffer.W = 8;


mux4	b2v_b_mux(
	.a(wdata[7:0]),
	.b(instr[7:0]),
	.c(SYNTHESIZED_WIRE_1),
	
	.s(ALUSrcB),
	.y(SYNTHESIZED_WIRE_4));
	defparam	b2v_b_mux.W = 8;


reg2	b2v_DR(
	.clk(clk),
	
	.WE(vcc),
	.data(SYNTHESIZED_WIRE_16),
	.RD(datar));
	defparam	b2v_DR.W = 17;


constant_value_generator	b2v_four(
	.out(SYNTHESIZED_WIRE_1));
	defparam	b2v_four.val = 1;
	defparam	b2v_four.W = 8;



ALU	b2v_inst1(
	.mode(mode),
	.a(SYNTHESIZED_WIRE_3),
	.b(SYNTHESIZED_WIRE_4),
	.op(ALUControl),
	.CO(CO),
	
	
	.Z(Z),
	.out(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst1.W = 8;


reg2	b2v_inst10(
	.clk(clk),
	
	.WE(vcc),
	.data(SYNTHESIZED_WIRE_5),
	.RD(wdata[7:0]));
	defparam	b2v_inst10.W = 8;


memory	b2v_inst12(
	.WE(MemWrite),
	.clk(clk),
	.ad(SYNTHESIZED_WIRE_6),
	.data(wdata),
	.RD(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst12.C = 256;
	defparam	b2v_inst12.W = 17;


mux4	b2v_inst2(
	.a(SYNTHESIZED_WIRE_7),
	.b(SYNTHESIZED_WIRE_17),
	.c(SYNTHESIZED_WIRE_9),
	
	.s(ALUSrcA),
	.y(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst2.W = 8;


mux4	b2v_inst3(
	.a(SYNTHESIZED_WIRE_10),
	.b(datar[7:0]),
	.c(SYNTHESIZED_WIRE_15),
	
	.s(ResultSrc),
	.y(res));
	defparam	b2v_inst3.W = 8;


constant_value_generator	b2v_inst4(
	.out(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst4.val = 0;
	defparam	b2v_inst4.W = 8;


reg2	b2v_inst5(
	.clk(clk),
	
	.WE(IRWrite),
	.data(SYNTHESIZED_WIRE_16),
	.RD(instr));
	defparam	b2v_inst5.W = 17;


mux2	b2v_inst6(
	.s(AdrSrc),
	.a(SYNTHESIZED_WIRE_17),
	.b(res),
	.y(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst6.W = 8;


controller	b2v_inst8(
	.clk(clk),
	.run(run),
	.reset(reset),
	.Z(Z),
	.CO(CO),
	.funct(instr[14:11]),
	.op(instr[16:15]),
	.PCReset(PCReset),
	.PCWrite(PCWrite),
	.IRWrite(IRWrite),
	.RegWrite(RegWrite),
	.MemWrite(MemWrite),
	.AdrSrc(AdrSrc),
	.mode(mode),
	.ALUControl(ALUControl),
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUSrcB),
	
	.ResultSrc(ResultSrc)
	);


reg2	b2v_inst9(
	.clk(clk),
	
	.WE(vcc),
	.data(SYNTHESIZED_WIRE_14),
	.RD(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst9.W = 8;


reg2	b2v_Program_Counter(
	.clk(clk),
	.reset(PCReset),
	.WE(PCWrite),
	.data(res),
	.RD(SYNTHESIZED_WIRE_17));
	defparam	b2v_Program_Counter.W = 8;


register_file	b2v_reg_file(
	.clk(clk),
	
	.WE(RegWrite),
	.A1(instr[7:5]),
	.A2(instr[4:2]),
	.A3(instr[10:8]),
	.data(res),
	.PC(res),
	.RD1(SYNTHESIZED_WIRE_14),
	.RD2(SYNTHESIZED_WIRE_5));
	defparam	b2v_reg_file.W = 8;

assign	DR_out = datar;
assign	Instruction = instr;
assign	result = res;
assign	vcc = 1;

endmodule
