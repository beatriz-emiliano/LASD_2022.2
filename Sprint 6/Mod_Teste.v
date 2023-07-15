`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

/*Sprint 5*/

//Wires
wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, w_clock_1hz;
wire [2:0] w_ULAControl, w_wa3;
wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData;
wire [31:0] w_Inst;

//Atribuições
assign w_d0x4 = w_PC;
assign LEDR[9] = w_RegWrite;
assign w_PCp1 = w_PC + 1;
assign LEDR[6:4] = w_ULAControl[2:0];
assign LEDR[7] = w_ULASrc;
assign LEDR[8] = w_RegDst;
assign LEDR[17] = w_clock_1hz;

//1khz - clock
divide_frequency clk_1hz(.Clk_50MHz(CLOCK_50), .Clk_1Hz(w_clock_1hz));

//PC
PC pc(.PCin(w_PCp1), .PC(w_PC), .clk(w_clock_1hz));

//Inst. Mem.
RomInstMem instr_mem(.address(w_PC), .q(w_Inst), .clock(CLOCK_50));

//Registrador
RegisterFile register_file(.ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]), .wa3(w_wa3), .wd3(w_wd3), .rd1(w_rd1SrcA), .rd2(w_rd2), .clk(w_clock_1hz), .we3(w_RegWrite),
									 .S0(w_d0x0), .S1(w_d0x1), .S2(w_d0x2), .S3(w_d0x3), .S4(w_d1x0), .S5(w_d1x1), .S6(w_d1x2), .S7(w_d1x3));

//Control Unit 
Control_Unit control_unit(.OP(w_Inst[31:26]), .Funct(w_Inst[5:0]), .ULAControl(w_ULAControl[2:0]), .ULASrc(w_ULASrc), .Jump(LEDR[0]), .MemtoReg(w_MemtoReg), .MemWrite(w_MemWrite),
								  .Branch(LEDR[3]),.RegDst(w_RegDst), .RegWrite(w_RegWrite));

//ULA
ULA ula(.SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULAResult(w_ULAResultWd3), .ULAControl(w_ULAControl[2:0]), .Z(LEDG[0]));

//Data Mem.
RamDataMem data_mem(.address(w_ULAResultWd3), .clock(CLOCK_50), .data(w_rd2), .wren(w_MemWrite), .q(w_RData));

//MUX 2x1
MUX2_1 MuxULASrc(.E0(w_rd2), .E1(w_Inst[7:0]), .saida(w_SrcB), .sel(w_ULASrc));
MUX2_1 MuxWR(.E0(w_Inst[20:16]), .E1(w_Inst[15:11]), .saida(w_wa3), .sel(w_RegDst));
MUX2_1 MuxDDest(.E0(w_ULAResultWd3), .E1(w_RData), .saida(w_wd3), .sel(w_MemtoReg));

endmodule 
