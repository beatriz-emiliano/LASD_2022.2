module ParallelOUT(input [7:0] Address, RegData, 
						 input we, clk,
						 output reg wren, 
						 output reg[7:0] DataOut);
                    
    reg fioB;
	 
	 always @ (*) begin
			if(~(Address == 8'hFF) & we)
            wren = 1;
         else
            wren = 0;
		end
    
    always @(posedge clk) begin        
        if(Address == 8'hFF & we)
            fioB = 1;
        else
            fioB = 0;
        
        if(fioB)
            DataOut = RegData;
    end
endmodule 