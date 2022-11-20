module sd1011_mealy_over(clk, din,reset, dout);
input clk, din, reset;
output reg dout;
parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
reg [1:0] state;
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
if(din) begin
state <= B;
dout <=1'b0;
end
else
dout <=1'b0;
end
B: begin
if(~din) begin
state <= C;
dout <=1'b0;
end
else begin
dout <=1'b0;
end
end
C: begin
if(din) begin
state <= D;
dout <=1'b0;
end
else begin
state <= A;
dout <=1'b0;
end
end
D: begin
if(din) begin
state <= B;
dout <=1'b1;
end
else begin
state <= C;
dout <=1'b0;
end
end
endcase
end
end
endmodule




//tb


module TB_sd1001_mealy_over_test;
reg clk, din, reset;
wire dout;
initial
begin
clk = 1'b1;
end
always #5 clk = ~clk ;
sd1011_mealy_over KK(clk, din,reset, dout);
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
