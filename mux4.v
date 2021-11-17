module mux4 #(parameter W=32) (input [W-1:0]a,b,c,d, input [1:0] s, output reg [W-1:0] y);


always @(*)
	case(s)
	0: y=a;
	1: y=b;
	2: y=c;
	3: y=d;
	endcase

endmodule