//gate level
module half_subtractor(x,y,d,b);
input x,y;
output d,b;
wire a;
xor(d,x,y);
not(a,x);
and(b,a,y);
endmodule


//data flow
module half_subtractor(x,y,d,b);
input x,y;
output d,b;
assign d = x^y;
assign b = (~x)&y;
endmodule


//behavorial
module half_subtractor(x,y,d,b);
input x,y;
output reg d,b;
always @(x or y)
begin
case({x,y})
begin
2'b00:begin d=0;b=0;end
2'b01:begin d=1;b=1;end
2'b10:begin d=1;b=0;end
2'b11:begin d=0;b=0;end
endcase
end
endmodule