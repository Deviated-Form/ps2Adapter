`timescale 1ns / 1ps

module top(
	// internal Clock
	input wire sysClk125M,

	// PMOD JE for Controller
	output wire je0, je1, je2,
	input  wire je4, je5//,

	// add your inputs and outputs here
);

	// Input and Output Wires
	wire ack, data;
	wire att, ctrClk, command;

	// Inputs and Outputs
	assign je0  = att;
	assign je1  = command;
	assign je2  = ctrClk;
	assign ack  = je4;
	assign data = je5 ;


	// declare your own in- and outputs here


	// add your logic here
	// preferably as a module, e.g.
	// newmodule instance(inputs, outputs);

	// Controller Module
	// Wires
	wire
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square;
	wire [7:0]
		leftX, leftY,
		rightX, rightY;

	// Module
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
