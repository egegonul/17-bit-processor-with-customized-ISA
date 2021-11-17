module reg2 #(parameter W=32) (input clk,reset,WE,input [W-1:0] data,
output reg [W-1:0] RD);

reg [W-1:0] R;

initial R=0;

always @(posedge clk)
begin
	if(reset) R<=0;    
	else if(WE) R<=data;  //data can be loaded only if write is enabled
end

always @(*)
	RD=R;
	
	
endmodule	
	