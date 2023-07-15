module RegisterFile(input [7:0] wd3, //Write Data
						  input clk, we3,  //Clock and Write Enable
                    input [2:0] wa3, ra1, ra2, //Write Adress, Register  Data 1 and Register Data 2
                    output reg [7:0] rd1, rd2); //Register Adress 1 and Register Adress 2
						  reg [7:0]  R0, R1, R2, R3, R4, R5, R6, R7; // Register
						  
	 always @(posedge clk) begin
		  // Registering
				R0 = 0;
		  if (we3 & (wa3 == 1))
				R1 = wd3;
		  if (we3 & (wa3 == 2))
				R2 = wd3;
		  if (we3 & (wa3 == 3))
				R3 = wd3;
		  if (we3 & (wa3 == 4))
				R4 = wd3;
		  if (we3 & (wa3 == 5))
				R5 = wd3;
		  if (we3 & (wa3 == 6))
				R6 = wd3;
		  if (we3 & (wa3 == 7))
				R7 = wd3;
	 end
		 
    always @(*) begin
		  // MUX 1
		  // Register Data 1 Values
		  case (ra1)
				3'b000: rd1 = 0;
				3'b001: rd1 = R1;
				3'b010: rd1 = R2;
				3'b011: rd1 = R3;
				3'b100: rd1 = R4;
				3'b101: rd1 = R5;
				3'b110: rd1 = R6;
				3'b111: rd1 = R7;
		  endcase
		  
		  case (ra2)
				3'b000: rd2 = 0;
				3'b001: rd2 = R1;
				3'b010: rd2 = R2;
				3'b011: rd2 = R3;
				3'b100: rd2 = R4;
				3'b101: rd2 = R5;
				3'b110: rd2 = R6;
				3'b111: rd2 = R7;
		  endcase
	end 
endmodule 