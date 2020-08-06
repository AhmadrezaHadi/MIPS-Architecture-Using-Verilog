`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:25 07/24/2020 
// Design Name: 
// Module Name:    ALU_32b 
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
module ALU_32b(
    input [3:0] operation,
    input [31:0] data_0,
    input [31:0] data_1,
    input clock,
    output zero,
    output [31:0] result
    );

	wire [31:0] smaller_data;
	
	assign smaller_data = (data_1 > data_0) ? data_0 : data_1;
	
	assign zero = (data_0 == data_1) ? 1'b1 : 1'b0;
		
	assign result = (operation == 4'b0000) ? data_0 & data_1 :
		(operation == 4'b0001) ? data_0 | data_1 :
		(operation == 4'b0010) ? data_0 + data_1 :
		(operation == 4'b0110) ? data_0 - data_1 :
		(operation == 4'b0111) ? smaller_data :
		(operation == 4'b1100) ? ~(data_0 | data_1) : 32'b0;

	
	

endmodule
