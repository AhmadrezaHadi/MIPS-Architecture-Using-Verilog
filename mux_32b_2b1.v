`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:12 07/24/2020 
// Design Name: 
// Module Name:    mux_32b_2b1 
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
module mux_32b_2b1(
    input s,
    input [31:0] data_0,
    input [31:0] data_1,
    output [31:0] data_out
    );
	
	assign data_out = s ? data_1 : data_0;
	
endmodule
