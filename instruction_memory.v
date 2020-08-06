`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:15 07/24/2020 
// Design Name: 
// Module Name:    instruction_memory 
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
module instruction_memory(
    input [4:0] instruction_address,
    output [31:0] instruction
    );
	
	reg [31:0]memory[0:31];
	integer i;
	
	initial
	begin
		memory[0] = 32'b001000_00000_00001_0000000000000011;
		memory[1] = 32'b001000_00000_00010_0000000000000011;
		memory[2] = 32'b000000_00001_00010_00011_00000_011000;
		memory[3] = 32'b100011_00010_00001_0000000000001010;
		memory[4] = 32'b000100_00001_00010_0000000000010100;
		
		
		//For reading from file
		//$readmemb("instruction.mem", memory);
	end
	
	
	
	assign instruction = memory[instruction_address];
endmodule
