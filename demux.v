//gate level(1 to 4)
module demux(S1,S0,D,y);
input D,S0,S1;
output [0:3]y;
wire NS0,NS1;
not(NS0,S0);
not(NS1,S1);
and(y[0],D,NS1,NS0);
and(y[1],D,NS1,S0);
and(y[2],D,S1,NS0);
and(y[3],D,S1,S0);
endmodule


//data flow
module demux(S1,S0,D,y);
input D,S0,S1;
output [0:3]y;
assign y[0] = D&(~S1)&(~S0);
assign y[1] = D&(~S1)&(S0);
assign y[2] = D&(S1)&(~S0);
assign y[3] = D&(S1)&(S0);
endmodule


//behavorial
module demux(S1,S0,D,y);
input D,S0,S1;
output reg [0:3]y;
always@(S1,S0,D)
begin
	case({S1,S0,D})
  begin
  	3'b001:y=4'1000;
    3'b011:y=4'0100;
    3'b101:y=4'0010;
    3'b111:y=4'0001;
  endcase
end
endmodule


//tb 

module DeMux14_tb;
wire op0, op1, op2, op3;
reg in, s0, s1;
DeMux14 gm(in, op0, op1, op2, op3, s0, s1);
initial
begin
s0 = 0; s1 = 0; in = 0; #100;
s0 = 0; s1 = 0; in = 1; #100;
s0 = 0; s1 = 1; in = 0; #100;
s0 = 0; s1 = 1; in = 1; #100;
s0 = 1; s1 = 0; in = 0; #100;
s0 = 1; s1 = 0; in = 1; #100;
s0 = 1; s1 = 1; in = 0; #100;
s0 = 1; s1 = 1; in = 1; #100;
end
endmodule
