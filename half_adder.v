//Gate level
module half_adder(a,b,s,c);
input a,b;
output s,c;
and(c,a,b);
xor(s,a,b);
endmodule


//Data flow
module half_adder(a,b,s,c);
input a,b;
output s,c;
assign s = a^b;
assign c = a&b;
endmodule


//Behavorial
module half_adder(a,b,s,cout);
input a,b;
output reg s,cout;
always @(a or b)
begin
if(a==0 && b==0)
begin
s = 0;
c = 0;
end
else if(a==0 && b==1)
begin
s = 1;
c = 0;
end
else if(a==1 && b==0)
begin
s = 1;
c = 0;
end
else if(a==1 && b==1)
begin
s = 0;
c = 1;
end
end


//using case (behavorial)
module half_adder(a,b,s,c);
input wire a,b;
output reg s,c;
always @(a or b)
begin
case({a,b})
2'b00:begin s=0;c=0;end
2'b01:begin s=1;c=0;end
2'b10:begin s=1;c=0;end
2'b11:begin s=0;c=1;end
endcase
end
endmodule
endmodule


//testbench
module halfadder_test();
reg a,b;
wire s,c;
halfadder h1(a,b,s,c);
initial begin
  #20 a=1'b0;  b=1'b0;
  #20 a=1'b0;  b=1'b1;
  #20  a=1'b1;  b=1'b0;
  #20 a=1'b1;  b=1'b1;
end
endmodule