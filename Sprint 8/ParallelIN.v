module ParallelIN(input [7:0] Address, MemData, DataIn, 
                  output[7:0] RegData);
                        
	assign RegData = (Address == 8'hFF) ? DataIn : MemData;
    
endmodule 