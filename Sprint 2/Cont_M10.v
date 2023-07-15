module Cont_M10(input clk, rst, 
					 output reg [3:0] cont);
					 
	always @(posedge clk)
		begin
			if(!rst)
			cont = 0; //para voltar pro zero
			else
				begin
					if(cont == 9)
						cont = 0;
					else
						cont = cont + 1;
				end
		end
endmodule 