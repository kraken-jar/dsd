module D_FF(Q, QB, D, CLK);
input D, CLK;
output Q, QB;
reg Q, QB;
always @(posedge CLK) begin Q = D;
QB = ~Q;
end 
endmodule


//tb

module D_FF_TB;
reg D;
reg CLK;
wire Q, QB;
D_FF uut(.Q(Q), .QB(QB), .D(D), .CLK(CLK));
always #100 CLK = ~CLK;
initial
begin
CLK = 1;
# 100 D = 1; #100 D = 0; 
end
endmodule