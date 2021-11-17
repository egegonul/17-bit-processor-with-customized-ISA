module ALU #(parameter W=32) (input [W-1:0] a,b,input mode,
input[2:0]op,  //opcode that determines the operation type, 3 bts for 6 operations
output reg [W-1:0]out,
output reg CO,N,V,Z); //flags

reg dummy;

always @(*)
begin
CO=0;V=0;   //CO and V initially set to 0 in case no arithmetic op occurs
	// arithmetic and logic operations are done if mode is 0
	if(~mode) begin
	case(op)      
	0: begin {CO,out}=a+b; V=(a[W-1]~^b[W-1])&(a[W-1]^out[W-1]);end  //ADD, CO and overflow set, overflow formula form 445 slides is used
	1: begin {CO,out}=a+~b+1;  V=(a[W-1]^b[W-1])&(a[W-1]^out[W-1]);  end //SUB
	2: out=a&b; //AND
	3: out=a|b; //OR
	4: out=a^b; //XOR
	5: out=0; //CLR
	endcase
	Z=out==0;  //Z and N flags set for every arithmetic or logic operation
	N=out[W-1];
	end
	
	else 
	case(op)
	0: out=a>>1;  //LSR
	1: out=a<<1;  //LSL
	2: out=a>>>1;   //ASR
	3: out=a<<<1;   //ASR
	4: begin out[W-1]=a[0]; {dummy,out[W-2:0]}=a>>1; end //ROR
	5: begin out[0]=a[W-1]; {out[W-1:1],dummy}=a>>1; end //ROL
	endcase
	
end

endmodule
