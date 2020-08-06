`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:01:57 07/24/2020 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(
	 input clock,
	 input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [31:0] write_data,
    input reg_write,
    output [31:0] read_data1,
    output [31:0] read_data2
    );


	reg [31:0] data_reg [0:31];
	
	initial
	begin
		data_reg[0] <= 32'b0;
		data_reg[13] <= 32'b11;
	end
	
	
	always @(posedge clock)
	begin
		data_reg[0] <= 32'b0;
		data_reg[13] <= 32'b11;
		
		if (reg_write)
			data_reg[write_reg] <= write_data;
	end
	
	assign read_data1 = data_reg[read_reg1];
	assign read_data2 = data_reg[read_reg2];
	
endmodule
