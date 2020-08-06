`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:51 07/25/2020 
// Design Name: 
// Module Name:    data_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module data_memory(
	 input clock,
    input [6:0] address,
    input [31:0] write_data,
    input mem_write,
    input mem_read,
    output [31:0] data_out
    );

	reg [31:0]data_mem[0:127];
	
	integer i;
	
	initial
	begin
		for (i = 0; i < 128; i = i + 1)
		begin
			data_mem[i] = 0;
		end
			
		data_mem[13] = 13;
	end
	
	always @(posedge clock)
	begin
	
		if (mem_write)
			data_mem[address] <= write_data;
	end
		
	assign data_out = (mem_read) ? data_mem[address] : 32'b0;
	
endmodule
