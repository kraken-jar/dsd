module sl(a,b,sl,q);
input a,b,sl;
output q;
assign q = (`sl & b) | (sl & a);
endmodule

module dff(d,clk,q);
input clk,d;
output q;
reg q = 0;
always @(posedge clk)
begin 
q<=d;
end
endmodule

module piso(f,clk,sl,q);
input [3:0]f;
input clk,sl;
output q;
wire q1,q2,q3,d1,d2,d3;
dff a(f[3],clk,q1);
sl a1(q1,f[2],sl,f1);
dff b(d1,clk,q2);
sl b1(q2,f[1],sl,d2);
dff c(d2,clk,q3);
sl c1(q3,f[0],sl,d3);
dff d(d3,clk,q);
endmodule


//tb

module testbench(); 
reg [3:0] d; 
reg clk, sl; 
wire q; 
piso d1(d, clk, sl, q); 
initial 
begin 
clk = 1'b0;
forever #5 clk = ~clk;
end 
initial 
begin 
sl = 0;
d = 4'b1101; 
# 10 sl = 1; 
# 10 sl = 1; 
# 10 sl = 1; 
# 10 sl = 0; 
d = 4'b1001; 
# 100 $finish; 
end 
endmodule
