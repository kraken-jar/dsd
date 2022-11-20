module upordown_counter(Clk,reset,UporDown,Count);
input Clk,reset,UporDown;
output [3:0]Count;
reg [3:0]Count=0;
always@(posedge(Clk)or posedge(reset))
begin
if (reset==1)
Count<=0;
else
if (UporDown==1)
if (Count==15)
Count<=0;
else
Count<=Count+1;
else
if (Count==0)
Count<=15;
else
Count<=Count-1;
end 
endmodule



//tb

module updowncounter_testbench();
reg clk, reset,up_down;
wire [3:0] counter;
upordown_counter dut(clk, reset,up_down, counter);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
up_down=0;
#20;
reset=0;
#200;
up_down=1;
end
endmodule
