//gate level(4 to 1)
module mux(s1,s0,D,y);
input [3:0]D;
input s1,s0;
output y;
wire NS1,NS0,a,b,c,d;
not(NS0,s0);
not(NS1,s1);
and(a,D[0],NS1,NS0);
and(b,D[1],NS1,S0);
and(c,D[2],S1,NS0);
and(d,D[3],S1,S0);
or(y,a,b,c,d);
endmodule


//data flow
module mux(S1,S0,D,y);
input [3:0]D;
input S1,S0;
output y;
assign y =((~S1)&(~S0)) | ((~S1)&S0) | (S1&(~S0)) | (S1&S0);
endmodule


//behavorial
module mux(S1,S0,D,y);
input [3:0]D;
input S1,S0;
output reg y;
always @(S1,S0,D)
begin
case({S1,S2})
begin
2'b00:y<=D[0];
2'b01:y<=D[1];
2'b10:y<=D[2];
2'b11:y<=D[3];
endcase
end
endmodule


//tb

module Mux41_tb;
wire op;
reg in0, in1, in2, in3, s0, s1;
Mux41 gm(op, in0, in1, in2, in3, s0, s1);
initial
begin
in0 = 0; in1 =0; in2 = 0; in3 = 0;
s0 = 0; s1 = 0; in0 = 0; #100;
s0 = 0; s1 = 0; in0 = 1; #100;
s0 = 0; s1 = 1; in1 = 0; #100;
s0 = 0; s1 = 1; in1 = 1; #100;
s0 = 1; s1 = 0; in2 = 0; #100;
s0 = 1; s1 = 0; in2 = 1; #100;
s0 = 1; s1 = 1; in3 = 0; #100;
s0 = 1; s1 = 1; in3 = 1; #100;
end
endmodule