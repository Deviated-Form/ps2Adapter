`timescale 1ns / 1ps

module byter(
		input  wire nextByte,
		input  wire [4:0] currentByte,
		input  wire [2:0] currentPackage,
		output wire [7:0] byteOut,           // Ausgabe des aktuellen Bytes
		output wire packageDone
	);

	// define module parameters
	// states
	localparam POLL     = 3'b000,
	           CONFENTR = 3'b001,
	           CONFANAL = 3'b010,
	           CONFEXIT = 3'b011;

	// Register initializing
	reg [7:0] allBytes [4:0][20:0]; // 3d array, 5 states by 16 different bytes 8bit Registers

	// register assignment
	assign byteOut = allBytes [currentPackage] [currentByte];
	assign packageDone = currentByte == 9;

	// intitializing the bytes
	initial begin
		// Poll
		allBytes [3'b000]  [0] = 8'h01; // always first byte
		allBytes [3'b000]  [1] = 8'h42; // Polling
		allBytes [3'b000]  [2] = 8'h00; // always third byte
		// Default Filler Bytes
		allBytes [3'b000]  [3] = 8'h00;
		allBytes [3'b000]  [4] = 8'h00;
		allBytes [3'b000]  [5] = 8'h00;
		allBytes [3'b000]  [6] = 8'h00;
		allBytes [3'b000]  [7] = 8'h00;
		allBytes [3'b000]  [8] = 8'h00;
		allBytes [3'b000]  [9] = 8'h00;
		allBytes [3'b000] [10] = 8'h00;
		allBytes [3'b000] [11] = 8'h00;
		allBytes [3'b000] [12] = 8'h00;
		allBytes [3'b000] [13] = 8'h00;
		allBytes [3'b000] [14] = 8'h00;
		allBytes [3'b000] [15] = 8'h00;
		allBytes [3'b000] [16] = 8'h00;
		allBytes [3'b000] [17] = 8'h00;
		allBytes [3'b000] [18] = 8'h00;
		allBytes [3'b000] [19] = 8'h00;
		allBytes [3'b000] [20] = 8'h00;

		// Enter config mode
		allBytes [3'b001]  [0] = 8'h01; // always first byte
		allBytes [3'b001]  [1] = 8'h43; // configure...
		allBytes [3'b001]  [2] = 8'h00; // always third byte
		allBytes [3'b001]  [3] = 8'h01; // enters config mode
		// Default Filler Bytes
		allBytes [3'b001]  [4] = 8'h00;
		allBytes [3'b001]  [5] = 8'h00;
		allBytes [3'b001]  [6] = 8'h00;
		allBytes [3'b001]  [7] = 8'h00;
		allBytes [3'b001]  [8] = 8'h00;
		allBytes [3'b001]  [9] = 8'h00;
		allBytes [3'b001] [10] = 8'h00;
		allBytes [3'b001] [11] = 8'h00;
		allBytes [3'b001] [12] = 8'h00;
		allBytes [3'b001] [13] = 8'h00;
		allBytes [3'b001] [14] = 8'h00;
		allBytes [3'b001] [15] = 8'h00;
		allBytes [3'b001] [16] = 8'h00;
		allBytes [3'b001] [17] = 8'h00;
		allBytes [3'b001] [18] = 8'h00;
		allBytes [3'b001] [19] = 8'h00;
		allBytes [3'b001] [20] = 8'h00;

		// Set analog mode
		allBytes [3'b010]  [0] = 8'h01; // always first byte
		allBytes [3'b010]  [1] = 8'h44; // set digital/analog
		allBytes [3'b010]  [2] = 8'h00; // always third byte
		allBytes [3'b010]  [3] = 8'h01; // set analog
		allBytes [3'b010]  [4] = 8'h03;
		// Default Filler Bytes
		allBytes [3'b010]  [5] = 8'h00; 
		allBytes [3'b010]  [6] = 8'h00;
		allBytes [3'b010]  [7] = 8'h00;
		allBytes [3'b010]  [8] = 8'h00;
		allBytes [3'b010]  [9] = 8'h00;
		allBytes [3'b010] [10] = 8'h00;
		allBytes [3'b010] [11] = 8'h00;
		allBytes [3'b010] [12] = 8'h00;
		allBytes [3'b010] [13] = 8'h00;
		allBytes [3'b010] [14] = 8'h00;
		allBytes [3'b010] [15] = 8'h00;
		allBytes [3'b010] [16] = 8'h00;
		allBytes [3'b010] [17] = 8'h00;
		allBytes [3'b010] [18] = 8'h00;
		allBytes [3'b010] [19] = 8'h00;
		allBytes [3'b010] [20] = 8'h00;

		// Exit config mode
		allBytes [3'b011]  [0] = 8'h01; // always first byte
		allBytes [3'b011]  [1] = 8'h43; // configure...
		allBytes [3'b011]  [2] = 8'h00; // always third byte
		allBytes [3'b011]  [3] = 8'h00; // exits config mode
		// Default Filler Bytes
		allBytes [3'b011]  [4] = 8'h5A;
		allBytes [3'b011]  [5] = 8'h5A;
		allBytes [3'b011]  [6] = 8'h5A;
		allBytes [3'b011]  [7] = 8'h5A;
		allBytes [3'b011]  [8] = 8'h5A;
		allBytes [3'b011]  [9] = 8'h5A;
		allBytes [3'b011] [10] = 8'h5A;
		allBytes [3'b011] [11] = 8'h5A;
		allBytes [3'b011] [12] = 8'h5A;
		allBytes [3'b011] [13] = 8'h5A;
		allBytes [3'b011] [14] = 8'h5A;
		allBytes [3'b011] [15] = 8'h5A;
		allBytes [3'b011] [16] = 8'h5A;
		allBytes [3'b011] [17] = 8'h5A;
		allBytes [3'b011] [18] = 8'h5A;
		allBytes [3'b011] [19] = 8'h5A;
		allBytes [3'b011] [20] = 8'h5A;

	end

endmodule
