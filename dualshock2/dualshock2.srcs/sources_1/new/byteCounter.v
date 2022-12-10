`timescale 1ns / 1ps

module byteCounter (
		input  wire packageDone,
		input  wire nextByte,
		output reg [4:0] currentByte
	);

	always @(posedge nextByte or posedge packageDone) begin
		if (packageDone) begin
			currentByte = 0;
		end
		else begin
			currentByte = currentByte + 1'b1;
		end
	end

endmodule
