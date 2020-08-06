`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:21:45 07/24/2020
// Design Name:   mux_32b_2b1
// Module Name:   G:/program/xilinx/FPGA_Project/mux_32b_2b1_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_32b_2b1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_32b_2b1_TB;

	// Inputs
	reg s;
	reg [31:0] data_0;
	reg [31:0] data_1;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	mux_32b_2b1 uut (
		.s(s), 
		.data_0(data_0), 
		.data_1(data_1), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		data_0 = 0;
		data_1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		s = 0;
		data_0 = 100;
		data_1 = 50;
		#100
		
		s = 0;
		data_0 = 200;
		data_1 = 100;
		#100
		
		s = 1;
		data_0 = 100;
		data_1 = 50;
		#100
		
		s = 1;
		data_0 = 200;
		data_1 = 100;
	end
      
endmodule

