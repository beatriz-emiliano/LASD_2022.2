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

wire clock;
wire [3:0] count;
//wire [3:0] count_18s;

/*Questão 1*/
//assign HEX0[0:6] = SW[6:0];

/*Questão 2*/
//decoder Decoder(._4bits(count),.display(HEX0[0:6]));
//decoder Decoder(._4bits(SW[11:8]),.display(HEX0[0:6]));

/*Questão 3*/
//divide_frequency Divide(.Clk_50MHz(CLOCK_50),.Clk_1Hz(LEDG[0]));
//divide_frequency Divide(.Clk_50MHz(CLOCK_50),.Clk_1Hz(clock));

/*Questão 4*/
decoder Decoder(._4bits(count),.display(HEX0[0:6]));
divide_frequency Divide(.Clk_50MHz(CLOCK_50),.Clk_1Hz(clock));
Cont_M10 Contador(.clk(clock),.rst(KEY[2]),.cont(count));

/*Desafio*/

//desafio_18s contador_18s(.Clk_50MHz(CLOCK_50),.Clk_1Hz(clock))
//desafio_2 Desafio(.clk(count_18s),.cont(LEDR[17:0]));



endmodule 
