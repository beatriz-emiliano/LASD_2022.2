module divide_frequency(input Clk_50MHz, 
								output reg Clk_1Hz);
								reg [25:0] clk;
	always @(posedge Clk_50MHz)
		begin
			if (clk == 25000000) 
				begin
					Clk_1Hz= ~Clk_1Hz; //inverte
					clk = 0;
				end
			else
			clk = clk + 1;
	end
	endmodule 