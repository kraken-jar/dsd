//gate level
module full_adder(x,y,z,s,c);
input x,y,z;
output  s,c;
wire a,b,d;
xor(a,x,y);
and(b,a,z);
and(d,x,y);
or(c,b,d);
xor(s,a,z);
endmodule


//data flow
module full_adder(x,y,z,s,c);
input x,y,z;
output  s,c;
assign s=x^y^z;
assign c=z&(x^y)|(x&y);
endmodule



//behavioural
module full_adder(x,y,z,s,c);
input wire x,y,z;
output reg s,c;
always @(x or y or z)
begin
case({a,b})
3'b000:begin s=0;c=0;end
3'b001:begin s=1;c=0;end
3'b010:begin s=1;c=0;end
3'b011:begin s=0;c=1;end
3'b100:begin s=1;c=0;end
3'b101:begin s=0;c=1;end
3'b110:begin s=0;c=1;end
3'b111:begin s=1;c=1;end
endcase
end
endmodule

