`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:34:55 07/24/2020
// Design Name:   ALU_32b
// Module Name:   G:/program/xilinx/FPGA_Project/ALU_32b_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_32b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_32b_TB;

	// Inputs
	reg [3:0] operation;
	reg [31:0] data_0;
	reg [31:0] data_1;
	reg clock;

	// Outputs
	wire zero;
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU_32b uut (
		.operation(operation), 
		.data_0(data_0), 
		.data_1(data_1), 
		.clock(clock), 
		.zero(zero), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		operation = 0;
		data_0 = 0;
		data_1 = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		operation = 4'b0000;
		data_0 = 1;
		data_1 = 3;
		#60
		
		operation = 4'b0001;
		data_0 = 1;
		data_1 = 3;
		#60
		
		operation = 4'b0010;
		data_0 = 1;
		data_1 = 3;
		#60
		
		operation = 4'b0110;
		data_0 = 3;
		data_1 = 1;
		#60
		
		operation = 4'b0111;
		data_0 = 10;
		data_1 = 30;
		#60
		
		operation = 4'b1100;
		data_0 = 0;
		data_1 = 0;
	end
	
	always #10 clock = ~clock;
      
endmodule

