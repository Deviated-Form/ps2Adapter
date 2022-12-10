module ledTest(
	input  wire
		// Clock
		sysClk,

		// Switches
		debug0, debug1, debug2,

		// Controller Buttons
		select, l3, r3, start,
		up, right, left, down,
		l2, r2, l1, r1,
		triangle, circle, X, square,
	input wire [7:0]
		// Controller Sticks
		leftX, leftY,
		rightX, rightY,

	output wire 
		led0, led1, led2, led3,
		ledR, ledG, ledB
);

	// Monochrome LEDs

	assign led0 = ( up       &&  debug0 && ~debug1 )
	            | ( triangle && ~debug0 && ~debug1 )
	            | ( select   &&  debug0 &&  debug1 )
	            | ( l2       && ~debug0 &&  debug1 );
	assign led1 = ( left     &&  debug0 && ~debug1 )
	            | ( square   && ~debug0 && ~debug1 )
	            | ( l3       &&  debug0 &&  debug1 )
	            | ( r2       && ~debug0 &&  debug1 );
	assign led2 = ( right    &&  debug0 && ~debug1 )
	            | ( circle   && ~debug0 && ~debug1 )
	            | ( r3       &&  debug0 &&  debug1 )
	            | ( l1       && ~debug0 &&  debug1 );
	assign led3 = ( down     &&  debug0 && ~debug1 )
	            | ( X        && ~debug0 && ~debug1 )
	            | ( start    &&  debug0 &&  debug1 )
	            | ( r1       && ~debug0 &&  debug1 );


	// Farb-LEDs
	wire lX, lY, rX, rY;

	assign ledR = ( lX &&  debug2 )
	            | ( rX && ~debug2 );

	assign ledG = 0;

	assign ledB = ( lY &&  debug2 )
	            | ( rY && ~debug2 );

	colorLED colorLED_inst (
		sysClk,
		leftX, leftY,
		rightX, rightY,
		lX, lY,
		rX, rY
	);

endmodule