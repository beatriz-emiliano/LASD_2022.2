module RegisterFile(
	input [7:0] wd3, //Write Data
	input clk, we3,  //Clock and Write Enable
   input [2:0] wa3, ra1, ra2, //Write Adress, Register Data 1 and Register Data 2
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
			0: rd1 = 0;
			1: rd1 = R1;
			2: rd1 = R2;
			3: rd1 = R3;
			4: rd1 = R4;
			5: rd1 = R5;
			6: rd1 = R6;
			7: rd1 = R7;
		endcase
		
		//MUX 2
		// Register Data 2 Values
		case (ra2)
			0: rd2 = 0;
			1: rd2 = R1;
			2: rd2 = R2;
			3: rd2 = R3;
			4: rd2 = R4;
			5: rd2 = R5;
			6: rd2 = R6;
			7: rd2 = R7;
		endcase
	end

endmodule
