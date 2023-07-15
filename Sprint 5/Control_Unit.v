module Control_Unit (input [5:0] OP, Funct,
							output reg Jump, MemtoReg, MemWrite, Branch, ULASrc, RegDst, RegWrite,
							output reg [2:0] ULAControl);
							
	always @ (*) begin
			
		case({OP, Funct}) 
			{6'b000000, 6'b100000}: //ADD
				begin
					RegWrite = 1'b1;
					RegDst = 1'b1;
					ULASrc = 1'b0;
					ULAControl = 3'b010;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			{6'b000000, 6'b100010}: //SUB
				begin
					RegWrite = 1'b1;
					RegDst = 1'b1;
					ULASrc = 1'b0;
					ULAControl = 3'b110;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			{6'b000000, 6'b100100}: //AND
				begin
					RegWrite = 1'b1;
					RegDst = 1'b1;
					ULASrc = 1'b0;
					ULAControl = 3'b000;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			{6'b000000, 6'b100101}: //OR
				begin
					RegWrite = 1'b1;
					RegDst = 1'b1;
					ULASrc = 1'b0;
					ULAControl = 3'b001;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			{6'b000000, 6'b100111}: //NOR
				begin
					RegWrite = 1'b1;
					RegDst = 1'b1;
					ULASrc = 1'b0;
					ULAControl = 3'b011;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			{6'b000000, 6'b101010}: //SLT
				begin
					RegWrite = 1'b1;
					RegDst = 1'b1;
					ULASrc = 1'b0;
					ULAControl = 3'b111;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			default:
				begin
					RegWrite = 1'b0;
					RegDst = 1'b0;
					ULASrc = 1'b0;
					ULAControl = 3'b000;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		endcase
		
		case(OP)
			6'b100011: //LW
				begin
					RegWrite = 1'b1;
					RegDst = 1'b0;
					ULASrc = 1'b1;
					ULAControl = 3'b010;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b1;
					Jump = 1'b0;
				end
		
			6'b101011: //SW
				begin
					RegWrite = 1'b0;
					RegDst = 1'bx;
					ULASrc = 1'b1;
					ULAControl = 3'b010;
					Branch = 1'b0;
					MemWrite = 1'b1;
					MemtoReg = 1'bx;
					Jump = 1'b0;
				end
		
			6'b000100: //BEQ
				begin
					RegWrite = 1'b0;
					RegDst = 1'bx;
					ULASrc = 1'b0;
					ULAControl = 3'b110;
					Branch = 1'b1;
					MemWrite = 1'b0;
					MemtoReg = 1'bx;
					Jump = 1'b0;
				end
		
			6'b001000: //ADDi
				begin
					RegWrite = 1'b1;
					RegDst = 1'b0;
					ULASrc = 1'b1;
					ULAControl = 3'b010;
					Branch = 1'b0;
					MemWrite = 1'b0;
					MemtoReg = 1'b0;
					Jump = 1'b0;
				end
		
			6'b000010: //J
				begin
					RegWrite = 1'b0;
					RegDst = 1'bx;
					ULASrc = 1'bx;
					ULAControl = 3'bxxx;
					Branch = 1'bx;
					MemWrite = 1'b0;
					MemtoReg = 1'bx;
					Jump = 1'b1;
				end
		
		endcase
		
	end
endmodule 