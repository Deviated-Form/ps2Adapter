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


	assign lX = {2'b00,  leftX} > ledCounter;
	assign lY = {2'b00,  leftY} > ledCounter;
	assign rX = {2'b00, rightX} > ledCounter;
	assign rY = {2'b00, rightY} > ledCounter;

endmodule
