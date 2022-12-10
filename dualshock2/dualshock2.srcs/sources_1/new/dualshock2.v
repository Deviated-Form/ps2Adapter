`timescale 1ns / 1ps

module dualshock2(
	//Sysclock, should be 125 MHz
	input wire sysClk, 

	// Inputs and Outputs to the DualShock 2 Controller
	output wire att, command, ctrClk,
	input  wire ack, data,

	// Controller Buttons
	output wire	
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square,

	// Controller Sticks
	output wire [7:0] leftX, leftY,
	                  rightX, rightY
);

	assign att = ((currentByte == 0) && nextByte);

	reg ps2Reset = 0;
	reg ps2Start = 1;
	wire [7:0] cmdByte;
	wire [7:0] ctrData;
	wire nextByte, byteDone;

	// CLK_DIV: 9 ~ 500kHz, 10 ~250kHz, 11~ 125kHz, 12 ~ 75kHz
	ps2 #(.CLK_DIV(11) ) // 11 works
	ps2_inst (
		sysClk,         // Clock in
		ps2Reset,       // reset
		data,           // input of the data wire
		command,        // output wire to the command wire
		ctrClk,         // controller clock output 
		ps2Start,       // start
		cmdByte,        // byte to output to controller cmd
		ctrData,        // byte read from the controller data
		byteDone,       // current byte is done
		nextByte        // ask for the next byte
	);

	byteInterpreter bi_inst (
		nextByte, ctrData, currentByte, currentPackage,
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square,
		rightX, rightY,
		leftX, leftY
	);

	wire packageDone;
	byter bytes_inst (
		nextByte,       // clock in
		currentByte,    // current byte in
		currentPackage, // shows that the package is done
		cmdByte,        // output
		packageDone
	);

	wire [4:0] currentByte;
	byteCounter byteCounter_inst (
		packageDone,    // Reset
		nextByte,       // Clock in
		currentByte     // output
	);

	parameter packageCounterBits = 3;
	reg resetPC = 0;
	wire [2:0] currentPackage;
	wire [packageCounterBits-1:0] resetAt = 3'd3;

	packageCounter #( .bits(packageCounterBits))
	packageCounter_inst (
		resetPC,        // reset
		packageDone,    // clock in
		resetAt,        // reset at this number
		currentPackage  // output
	);


endmodule
