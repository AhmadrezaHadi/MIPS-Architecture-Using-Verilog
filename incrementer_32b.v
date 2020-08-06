`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:28 07/24/2020 
// Design Name: 
// Module Name:    incrementer_32b 
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
module incrementer_32b(
    input [31:0] data_in,
    output [31:0] data_out
    );

	assign data_out = data_in + 32'b1;

endmodule