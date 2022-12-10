`timescale 1ns / 1ps

module top(
	// intere Clock
	input wire sysClk125M,

	// PMODs, JC for Oszi, JE for Controller
	output wire je0, je1, je2,
	input  wire je4, je5,
	output wire jc0, jc1, jc2, jc4, jc5,

	// LEDs zum Testen
	output wire led6_r, led6_g, led6_b,
	output wire led0, led1, led2, led3,

	// switches
	input  wire sw0, sw1, sw2
);

	wire ack, data;
	wire att, ctrClk, command;

	// Real Inputs and Outputs
	assign je0  = att;
	assign je1  = command;
	assign je2  = ctrClk;
	assign ack  = je4;
	assign data = je5 ;

	// Oszi Outputs
	assign jc0 = att;
	assign jc1 = command;
	assign jc2 = ctrClk;
	assign jc4 = ack;
	assign jc5 = data;

	// Debugging Switches
	wire   debug0, debug1, debug2, debug3;
	assign debug0 = sw0;
	assign debug1 = sw1;
	assign debug2 = sw2;

	//Testing
	wire   ledR, ledG, ledB;
	assign led6_r = ledR;
	assign led6_g = ledG;
	assign led6_b = ledB;

	ledTest test_inst(
		// Clock
		sysClk125M,

		// Switches
		debug0, debug1, debug2,

		// Controller Buttons
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square,
		
		// Controller Sticks
		leftX, leftY,
		rightX, rightY,

		// LEDs
		led0, led1, led2, led3,
		ledR, ledG, ledB
	);


	// Implementation
	wire
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square;
	wire [7:0]
		leftX, leftY,
		rightX, rightY;

	dualshock2 ds2_inst (
		sysClk125M,           // clock
		att, command, ctrClk, // outputs to the controller
		ack, data,            // inputs from the controller

		// Controller Buttons
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square,
		
		// Controller Sticks
		leftX, leftY,
		rightX, rightY
	);
endmodule
