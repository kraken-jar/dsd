//gate level
module full_subtractor(x,y,z,d,b);
input x,y,z;
output d,b;
wire m,n,o,p;
xor(m,x,y);
xor(d,m,z);
not(n,m);
not(o,a);
and(p,o,y);
or(b,p,n);
endmodule


//data flow
module half_subtractor(x,y,z,d,b);
input x,y,z;
output d,b;
assign d = (x^y)^z;
assign b = (~x&y)|(z&(~(x^y)));
endmodule


//behavorial
module half_subtractor(x,y,d,b);
input x,y;
output reg d,b;
always @(x or y or z)
begin
case({x,y,z})
begin
3'b000:begin d=0;b=0;end
3'b001:begin d=1;b=1;end
3'b010:begin d=1;b=1;end
3'b011:begin d=0;b=1;end
3'b000:begin d=1;b=0;end
3'b000:begin d=0;b=0;end
3'b000:begin d=0;b=0;end
3'b000:begin d=1;b=1;end
endcase
end
endmodule