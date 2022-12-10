`timescale 1ns / 1ps

module packageCounter
	#(
		parameter bits=3
	)(
		input  wire reset,
		input  wire clock,
		input  wire [bits-1:0] resetAt,
		output reg  [bits-1:0] currentByte
	);

	always @(posedge clock or posedge reset) begin
		if (reset) begin
			currentByte = 0;
		end
		else if (currentByte == resetAt) begin
			currentByte = 0;
		end 
		else begin
			currentByte = currentByte + 1'b1;
		end
	end

endmodule
