`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:49 07/25/2020
// Design Name:   mips
// Module Name:   G:/program/xilinx/FPGA_Project/mips_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_TB;

	// Inputs
	reg clock;
	
	//	Outputs
	wire [31:0]RB_Output1;
	wire [31:0]RB_output2;
	wire [31:0]ALU_output;
	wire [31:0]DM_mux_output;
	wire [31:0]PC_Output;
	wire [31:0]PC_Input;
	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clock(clock),
		.RB_Output1(RB_Output1),
		.RB_output2(RB_output2),
		.ALU_output(ALU_output),
		.DM_mux_output(DM_mux_output),
		.PC_Output(PC_Output),
		.PC_Input(PC_Input)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50
		clock = 1;
		#50
		clock = 0;
		
		#50
		clock = 1;
		#50
		clock = 0;
		
		#50
		clock = 1;
		#50
		clock = 0;
		
		#50
		clock = 1;
		#50
		clock = 0;
		
		#50
		clock = 1;
		#50
		clock = 0;
		
		#50
		clock = 1;
		#50
		clock = 0;
		
		#50
		clock = 1;
		#50
		clock = 0;
		
	end
	
	

endmodule

