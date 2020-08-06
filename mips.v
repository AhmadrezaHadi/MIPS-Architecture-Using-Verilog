`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:07:45 07/25/2020 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clock, 
	 output [31:0]wire_DM
    );
	 
always @(posedge clock)
begin

	$display("Program counter Output : %d", pc_out);
	$display("instruction : %b", instruction);
	$display("Program Counter next input : %d", pc_in);
	$display("Sign Extend Output : %b", SE_out);
	$display("PC Incrementer Output : %b", PC_inc);
	$display("ALU Add : %b", ALU_add);
	$display("ALU RegWrite : ",RegWrite);
	$display("Register Bank First Read Input : %b", instruction[25:21]);
	$display("Register Bank Second Read Input : %b", instruction[20:16]);
	$display("Register Bank First Output : %b", read_data1);
	$display("Register Bank Second Output : %b", read_data2);
	$display("ALU Result : %d", ALU_result);
	$display("MemtoReg : %d", MemtoReg);
	$display("DM mux output (write data for RB) : %d", write_data);
	$display("--------------------------------------------------------");
	$display("--------------------------------------------------------");
end
	 
	//
	//wire wire_DM;
	//wire wi
	
	//Wires 
	wire [31:0] pc_in;
	wire [31:0] pc_out;
	
	wire [31:0]instruction;
	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [1:0] ALUop;
	wire MemWrite;
	wire ALUsrc;	
	wire RegWrite;
	
	wire [31:0]SE_out; //sign extend output
	
	wire [31:0]PC_inc;
	wire [31:0]ALU_add;
	wire and_BZ;
	
	
	
	
	
	
	//IM input & outputs
	wire [4:0]write_register;
	wire [31:0]read_data1;
	wire [31:0]read_data2;
	
	
	//ALU input & outputs
	wire zero;
	wire [31:0]ALU_data_1;
	wire [3:0]ALU_control_out;
	wire [31:0]ALU_result;
	
	//DM input & outputs
	wire [31:0]write_data; //mux output
	wire [31:0]DM_output;
	
	//adder assignment
	assign and_BZ = zero & Branch;
	
	assign wire_DM = DM_output;
	
	register_32b PC(.clock(clock), .input_reg(pc_in), .output_reg(pc_out));
	
	instruction_memory IM(.instruction_address(pc_out[4:0]), .instruction(instruction));
	
	Control control(
		.inst_in(instruction[31:26]),
		.RegDst(RegDst),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.ALUop(ALUop),
		.MemWrite(MemWrite),
		.ALUsrc(ALUsrc),
		.RegWrite(RegWrite)
		);

	sign_extend SE(.data_in(instruction[15:0]), .data_out(SE_out));
	
	incrementer_32b PC_Adder(.data_in(pc_out), .data_out(PC_inc));

	// ALU adder 
	assign ALU_add = PC_inc + SE_out;

	mux_32b_2b1 mux_pc(.s(and_BZ), .data_0(PC_inc), .data_1(ALU_add), .data_out(pc_in));
	
	//mux_32b_2b1 mux_IM(.s(RegDst), .data_0(instruction[20:16]), .data_1(instruction[15:11]), .data_out(write_register));
	assign write_register = (RegDst) ? instruction[15:11] : instruction[20:16];
	
	mux_32b_2b1 mux_ALU(.s(ALUsrc), .data_0(read_data2), .data_1(SE_out), .data_out(ALU_data_1));
	
	
	mux_32b_2b1 mux_DM(.s(MemtoReg), .data_0(ALU_result), .data_1(DM_output), .data_out(write_data));
	
	register_bank RB(
		.clock(clock),
		.read_reg1(instruction[25:21]),
		.read_reg2(instruction[20:16]),
		.write_reg(write_register),
		.write_data(write_data),
		.reg_write(RegWrite),
		.read_data1(read_data1),
		.read_data2(read_data2)
		);
		
	assign wire_RB_read1 = read_data1;
	assign wire_RB_read2 = read_data2;
	
	ALU_32b ALU(
		.operation(ALU_control_out),
		.data_0(read_data1),
		.data_1(ALU_data_1),
		.clock(clock),
		.zero(zero),
		.result(ALU_result)
	);
	
	assign wire_ALU_Result = ALU_result;
	
	ALU_control ALU_ctrl(
		.ALU_op(ALUop),
		.inst(instruction[5:0]),
		.op(ALU_control_out)
		);
		
	data_memory DM(
		.clock(clock),
		.address(ALU_result[6:0]),
		.write_data(read_data2),
		.mem_write(MemWrite),
		.mem_read(MemRead),
		.data_out(DM_output)
		);
		
	
endmodule
