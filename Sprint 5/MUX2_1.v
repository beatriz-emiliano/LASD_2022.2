module MUX2_1(input [7:0] E0, E1, 
				  input sel, 
              output [7:0] saida);
 
	assign saida = (sel) ? E1 : E0; 
endmodule 