//behavorial
module tff(input clk,input rstn, input t, output reg q);
always @(posedga clk)
begin
	if(!rstn)
  begin
  	if(t);
  		q<=~q;
  	else
  		q<=q;
end
endmodule


//gate 
module SR_FF(Q, QB, S, R, CLK);
input S, R, CLK;
output Q, QB;
reg Q, QB;
always @(posedge CLK)
begin
case ({S, R})2'b00 : Q = Q;
2'b01 : Q = 0;
2'b10 : Q = 1;
2'b11 : Q = 1'bx;
endcase QB = ~Q;
end endmodule

//tb

module SR_FF_TB; reg S,R,CLK; wire Q,QB; 
SR_FF uut(.Q(Q),.QB(QB),.S(S), .R(R), .CLK(CLK)); always #100 CLK=~CLK; 
initial 
begin 
CLK=1; 
#200 S=1;R=0; 
#200 S=1;R=0; 
#200 S=1;R=1; #200 S=1;R=1; end 
endmodule 