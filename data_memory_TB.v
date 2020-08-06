`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:33 07/25/2020
// Design Name:   data_memory
// Module Name:   G:/program/xilinx/FPGA_Project/data_memory_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_memory_TB;

	// Inputs
	reg clock;
	reg [6:0] address;
	reg [31:0] write_data;
	reg mem_write;
	reg mem_read;
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clock(clock), 
		.address(address), 
		.write_data(write_data), 
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		address = 0;
		write_data = 0;
		mem_write = 0;
		mem_read = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		address = 100;
		write_data = 3;
		mem_write = 1;
		
		#40
		
		mem_write = 0;
		mem_read = 1;
	end
	
	always #20 clock = ~clock;
      
endmodule

