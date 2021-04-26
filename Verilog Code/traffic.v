// 4-WAY Traffic control using FSM (Finite State Machine)

module tr_lights(clk,rst,EW_lights,NS_lights,state);
input wire clk; 
input wire rst; 
output reg [1:0] EW_lights;   // East - West Lights
output reg [1:0] NS_lights;   // North - South Lights
output reg [2:0] state;  

reg [3:0] count;  

// STATES 
parameter S0 = 3'b000;  
parameter S1 = 3'b001;
parameter S2 = 3'b010; 
parameter S3 = 3'b011;  
parameter S4 = 3'b100;  
parameter S5 = 3'b101;   

// DELAYS
parameter sec1 = 4'b0001; // 1 sec delay
parameter sec5 = 4'b0101; // 5 sec delay 

// LIGHTS
parameter RED = 00; 
parameter YELLOW = 01; 
parameter GREEN = 10; 

always @(posedge clk or rst)   
begin 
   if (!rst) 
   begin   
   case(state)
       S0: if(count < sec5)
 		begin
		state <= S0;
 		count <= count + 1;
 		end
	   else
 		begin
 		state <= S1;
 		count <= 0;
 		end
 
 	S1: if(count < sec1)
 		begin
 		state <= S1;
 		count <= count + 1;
 		end
 	    else
 		begin
 		state <= S2;
 		count <= 0;
 		end
 	S2: if(count < sec1)
 		begin
 		state <= S2;
 		count <= count + 1;
 		end
 	    else
 		begin
 		state <= S3;
 		count <= 0;
 		end 
 	S3: if(count < sec5)
 		begin
 		state <= S3;
 		count <= count + 1;
 		end
 	    else
 		begin
 		state <= S4;
 		count <= 0;
 		end
 	S4: if(count < sec1)
 		begin
 		state <= S4;
 		count <= count + 1;
 		end
 	    else
 		begin
 		state <= S5;
 		count <= 0;
 		end
 	S5: if(count < sec1)
 		begin
 		state <= S5;
 		count <= count + 1;
 		end
 	    else
 		begin
 		state <= S0;
 		count <= 0;
 		end
	
	default state <= S0;
	endcase
     end
   else 
	begin
   	state <= S0;
   	count <= 0;
 	end 
end
 
 always @(*)
 begin
     case(state)
	S0: begin 
		EW_lights = RED;	
		NS_lights = GREEN;
	    end

	S1: begin 
		EW_lights = RED;	
		NS_lights = YELLOW;
            end

	S2: begin 
		EW_lights = RED;	
		NS_lights = RED;
            end

	S3: begin 
		EW_lights = GREEN;	
		NS_lights = RED;
            end

	S4: begin 
		EW_lights = YELLOW;	
		NS_lights = RED;
            end
	
	S5: begin 
		EW_lights = RED;	
		NS_lights = RED;
            end
	  	
	 default begin 
	 	EW_lights = RED;	
		NS_lights = GREEN;
	         end
     endcase
 end

endmodule
