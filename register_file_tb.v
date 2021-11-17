module register_file_tb #(parameter W=8) ();
reg clk,reset,WE;
reg [2:0] A1,A2,A3;
reg [W-1:0] data;
wire [W-1:0] RD1,RD2;
reg [W-1:0] RD1_exp,RD2_exp;	
reg [3:0] i;

reg [17:0] testvec [1:0];
register_file dut( .clk(clk),.reset(reset),.WE(WE),.A1(A1),.A2(A2),.A3(A3), .data(data), .PC(PC), .RD1(RD1),.RD2(RD2));


always
begin
clk = 0; #10; clk = 1; #10;
end



initial
begin
#1; {WE,A1,A2,A3,data}=18'b100010010110010010;
end

always @(negedge clk)
begin
i=i+1;
if(i==3)
	$stop;
end



endmodule