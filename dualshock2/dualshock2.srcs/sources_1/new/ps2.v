`timescale 1ns / 1ps

module ps2 #(parameter CLK_DIV = 9)(
	input  wire clock,          // input clock
	input  wire reset,          // reset of this state machine
	input  wire ctrData,        // wire from controller data
	output wire command,        // wire to controller cmd
	output wire ctrClk,         // wire to controller clock
	input  wire start,          // start signal
	input  wire [7:0] cmdByte,  // byte to output to controller cmd
	output wire [7:0] dataByte, // byte inputted through controller clock
	output wire byteDone,       // signals that the byte is done
	output wire nextByte        // ask for new data
);

	//define module parameters
	localparam STATE_SIZE = 2; //number of state registers
	//used states
	localparam IDLE     = 2'b00,
	           PAUSE    = 2'b01,
	           TRANSFER = 2'b10,
	           WAITACK  = 2'b11;

	// Register initializing
	reg [CLK_DIV-1:0] sclkNext, sclkNow;
	reg [STATE_SIZE-1:0] stateNext, stateNow;
	reg [7:0] dataByteNext, dataByteNow;
	reg [7:0] byteNext, byteNow;
	reg [2:0] counterNext, counterNow;
	reg nextByteNext, nextByteNow;
	reg cmdBitNext, cmdBitNow;

	// register assigned
	//assign ctrClk   = (sclkNow[CLK_DIV-1]) | (stateNow != TRANSFER);
	assign ctrClk   = (sclkNow[CLK_DIV-1]) && (stateNow == TRANSFER);
	assign byteDone = (stateNow == IDLE);
	assign command  = ( cmdBitNow && (stateNow == TRANSFER) );// | stateNow != TRANSFER;
	assign dataByte = dataByteNow;
	assign nextByte = nextByteNow;

	always @(*) begin
		sclkNext = sclkNow;
		byteNext = byteNow;
		cmdBitNext = cmdBitNow;
		counterNext = counterNow;
		dataByteNext = dataByteNow;
		stateNext = stateNow;

		case (stateNow)

			IDLE: begin
				sclkNext = 0;            // reset clock counter
				counterNext = 3'b000;    // reset bit counter
				dataByteNext = byteNow;

				if (start == 1'b1) begin // if start command
					byteNext = cmdByte;  // copy byte to send
					stateNext = PAUSE;   // change state
					nextByteNext = 1'b0;
				end
			end
			
			PAUSE: begin
				sclkNext = sclkNow + 1'b1;            // increment clock counter
				nextByteNext = 1'b0;
				if (sclkNow == {CLK_DIV{1'b1}}) begin // if clock is full (about to rise)
					sclkNext = 0;                     // reset to 0
					stateNext = TRANSFER;             // change state
				end
			end
			
			TRANSFER: begin
				sclkNext = sclkNow + 1'b1;  // increment clock counter
				nextByteNext = 1'b0;
				dataByteNext = 8'b00000000;

				if (sclkNow == 0) begin     // if clock counter is 0
					cmdBitNext = byteNow[0];  // output the LSB of data
				end else if (sclkNow == {{1'b0},{CLK_DIV-1{1'b1}}}) begin  // else if it's half full (about to rise)
					byteNext = {ctrData, byteNow[7:1]}; // read in data (shift in)

				end else if (sclkNow == {CLK_DIV{1'b1}}-1) begin  // else if it's full (about to fall) (minus one, so one before and not during)
					counterNext = counterNow + 1'b1;  // increment bit counter

					if (counterNow == 3'b111) begin // if we are on the last bit
						stateNext = WAITACK;  // change state
						sclkNext = 0;         // set it to half full (after rising)
						counterNext = 3'b000; // reset counter
					end
				end
			end

			WAITACK: begin
				sclkNext = sclkNow + 1'b1;  // increment clock counter
				dataByteNext = byteNow;

				if (sclkNow == {CLK_DIV{1'b1}}-1) begin // if it's full (about to fall) (minus one, so one before and not during)
					counterNext = counterNow + 1'b1;      // increment bit counter
					sclkNext = 0;

					if (counterNow == 3'b111) begin     // if we are on the last bit
						stateNext = IDLE;       // change state
						dataByteNext = byteNow; // output data byte
						nextByteNext = 1'b1;    // signal data is valid
					end
				end
			end

			default: begin
				stateNext = IDLE;
			end
		endcase
	end

	always @(posedge clock) begin
		if (reset) begin
			counterNow  <= 3'b000;
			byteNow     <= 8'b00000000;
			sclkNow     <= 0;
			cmdBitNow   <= 1'b1;
			stateNow    <= IDLE;
			dataByteNow <= 8'b11111111;
			nextByteNow <= 1'b0;

		end else begin
			counterNow  <= counterNext;
			byteNow     <= byteNext;
			sclkNow     <= sclkNext;
			cmdBitNow   <= cmdBitNext;
			stateNow    <= stateNext;
			dataByteNow <= dataByteNext;
			nextByteNow <= nextByteNext;

		end
	end

endmodule