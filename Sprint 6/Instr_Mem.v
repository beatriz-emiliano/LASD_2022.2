module Instr_Mem (input [7:0] A, 
						output reg [31:0] RD);

	always @ (*) begin
		case(A)
			8'b00: RD = 32'b_001000_00000_00001_00000_00000_000011;
         	8'b01: RD = 32'b_001000_00000_00010_00000_00000_001001;
        	8'b10: RD = 32'b_000000_00001_00010_00010_00000_100000;
         	8'b11: RD = 32'b_000000_00001_00010_00011_00000_100100;
         	8'b100: RD = 32'b_000000_00001_00010_00100_00000_100101;
         	8'b101: RD = 32'b_000000_00001_00010_00101_00000_100111;
         	8'b110: RD = 32'b_000000_00101_00100_00110_00000_101010;
			default: RD = 32'b0;
      endcase
   end
endmodule 
