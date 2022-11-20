//JK flip flop gate level
module JkFF(q,qbar,clk,j,k);
input j,k,clk;
output q,qbar;
wire nand1,nand2;
nand(nand1,j,clk,qbar);
nand(nand2,k,clk,q);
nand(q,nand1,qbar);
nand(qbar,nand2,q);
endmodule


//behavorial
module JKFF(clk,j,k,q,qbar);
input clk,j,k;
output reg q,qbar;
always@(posedge clk)
begin
	case({j,k})
  begin
  	2'b00:begin q<=q;qbar<=qbar;end
    2'b01:begin q<=0;qbar<=1;end
    2'b10:begin q<=1;qbar<=0;end
    2'b11:begin q<=~q;qbar<=~qbar;end
  endcase
end
endmodule


//testbench
      module jkff_test;
      reg J,K, CLK;
      wire Q, QBAR;

      //2. Instantiate the module we want to test. We have instantiated the jkff_behavior
      jkff_behavior dut(.q(Q), .qbar(QBAR), .j(J), .k(K), .clk(CLK)); // instantiation by port name.

      //3. Monitor TB ports
      $monitor("simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QBAR);

      //4. apply test vectors
      initial begin
        clk=0;
           forever #10 clk = ~clk;  
      end 
      initial begin 
       J= 1; K= 0;
       #100; J= 0; K= 1; 
       #100; J= 0; K= 0; 
       #100; J= 1; K=1; 
      end 
endmodule