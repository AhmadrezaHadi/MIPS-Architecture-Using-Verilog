`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:56 07/24/2020
// Design Name:   incrementer_32b
// Module Name:   G:/program/xilinx/FPGA_Project/incrementer_32b_TB.v
// Project Name:  FPGA_Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: incrementer_32b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module incrementer_32b_TB;

    reg [31:0] data_in;
    wire [31:0] data_out;
    integer i;

    incrementer_32b uut (
        .data_in(data_in), 
        .data_out(data_out)
    );

	initial
	begin
		
		data_in = 32'b0;
      
		for (i = 0; i < 100; i = i + 1)
        begin
            #10
            data_in = i;
        end
    end

endmodule
