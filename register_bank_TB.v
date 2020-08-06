`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:08:42 07/24/2020
// Design Name:   register_bank
// Module Name:   G:/program/xilinx/FPGA_Project/register_bank_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_bank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_bank_TB;

	// Inputs
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;
	reg [4:0] write_reg;
	reg [31:0] write_data;
	reg reg_write;
	reg clock;


	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	register_bank uut (
		.clock(clock),
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.reg_write(reg_write), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);

	initial begin
		// Initialize Inputs
		read_reg1 = 0;
		read_reg2 = 0;
		write_reg = 0;
		write_data = 0;
		reg_write = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		read_reg1 = 24;
		read_reg2 = 10;
		write_reg = 10;
		write_data = 1;
		reg_write = 1;
		
		#100
		read_reg1 = 24;
		read_reg2 = 10;
		write_reg = 24;
		write_data = 2;
		reg_write = 1;
	end

	always #20 clock = ~clock;
endmodule

