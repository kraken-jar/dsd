module sd1011_moore_over(clk, reset, din, dout);
input clk, din, reset;
output reg dout;
parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, 
E=3'b100;
reg [2:0] state;
always @ (posedge clk or reset or din)
begin
if (reset)
begin
state <= A ;
dout <=1'b0;
end
else
begin
case(state)
A: begin
dout <=1'b0;
if(din)
state <= B;
end
B: begin
dout <= 1'b0;
if(~din)
state <= C;
end
C: begin
dout <= 1'b0;
if(din)
state <= D;
else
state <= A;
end
D: begin
dout <= 1'b0;
if(din)
state <= E;
else
state <= C;
end
E: begin
dout <= 1'b1;
if(din)
state <= B;
else
state <= C;
end
endcase
end
end
endmodule


//tb


module TB_sd1011_moore_over_test;
reg clk, din, reset;
wire dout;
sd1011_moore_over UUT(clk, reset, din, dout);
initial
begin
clk = 1'b1;
end
always #5 clk = ~clk;
initial
begin
#0 reset = 1'b1;
#10 reset = 1'b0; 
din = 1'b0; #10
din = 1'b1; #10
din = 1'b0; #10
din = 1'b1; #10
din = 1'b1; #10
din = 1'b0; #10
din = 1'b1; #10
din = 1'b0; #10
din = 1'b1; #10
din = 1'b1; #10
din = 1'b1;
end
endmodule
