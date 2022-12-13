`timescale 1ns / 1ps

module ledRGB (
	input  wire sysClk,
	input  wire [7:0]
		leftX, leftY,
		rightX, rightY,
	output wire 
		lX, lY,
		rX, rY
);

	reg [9:0] ledCounter;

	always @(posedge sysClk) begin
		if ( ledCounter == 10'b1111111111 ) begin
			ledCounter = 0;
		end
		else begin
			ledCounter = ledCounter + 1;
		end
	end


	assign lX = {leftX,  2'b00 } > ledCounter;
	assign lY = {leftY,  2'b00 } > ledCounter;
	assign rX = {rightX, 2'b00 } > ledCounter;
	assign rY = {rightY, 2'b00 } > ledCounter;

endmodule
