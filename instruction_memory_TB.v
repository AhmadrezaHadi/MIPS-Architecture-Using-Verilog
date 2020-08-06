`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:49:01 07/24/2020
// Design Name:   instruction_memory
// Module Name:   G:/program/xilinx/FPGA_Project/instruction_memory_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_memory_TB;

	// Inputs
	reg [4:0] instruction_address;

	// Outputs
	wire [31:0] instruction;
	
	// other
	integer i;
	
	// Instantiate the Unit Under Test (UUT)
	instruction_memory uut (
		.instruction_address(instruction_address), 
		.instruction(instruction)
	);


	initial begin
		// Initialize Inputs
		instruction_address = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i < 2**5; i = i + 1)
		begin
			#20
			instruction_address = i;
			
		end
	end
      
endmodule

