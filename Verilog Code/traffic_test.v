// Test Bench for Traffic Light Controler

`timescale 1ms/1ms
module tb_tlc;
reg clk; 
reg rst;  
wire [2:0] state;
wire [1:0] EW_lights;   // East - West Lights
wire [1:0] NS_lights;   // North - South Lights

tr_lights uut(.clk(clk),
      .rst(rst),
	      .EW_lights(EW_lights),
      .NS_lights(NS_lights),
      .state(state)
);

always #500 clk = ~clk;
initial
 begin
  #1000;
  clk <= 1;
  rst <= 1; #1000; 
  rst <= 0;  
  end

endmodule
