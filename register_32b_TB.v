`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:06:11 07/24/2020
// Design Name:   register_32b
// Module Name:   G:/program/xilinx/FPGA_Project/register_32b_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_32b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module register_32b_TB;

	// Inputs
	reg clock;
	reg [31:0]input_reg;
	wire [31:0]output_wire;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	register_32b uut (
		.clock(clock),
		.input_reg(input_reg),
		.output_reg(output_wire)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i < 200; i = i + 1)
		begin
			#20
			input_reg = i;
		end
	end
	
	always #30 clock = ~clock;
      
endmodule