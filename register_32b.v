`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:36 07/24/2020 
// Design Name: 
// Module Name:    register_32b 
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
module register_32b(
    input clock,
    input [31:0] input_reg,
    output [31:0] output_reg
    );


reg [31:0]data = 32'b0;

assign output_reg = data;

always @(posedge clock)
	data <= input_reg;
	
endmodule