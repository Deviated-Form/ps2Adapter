`timescale 1ns / 1ps

module byteInterpreter (
	input wire nextByte,
	input wire [7:0] ctrData,
	input wire [4:0] currentByte,
	input wire [2:0] currentPackage,
	output reg select, l3, r3, start,
	output reg up, right, left, down,
	output reg l2, r2, l1, r1,
	output reg triangle, circle, X, square,
	output reg [7:0] rightX, rightY,
	output reg [7:0] leftX, leftY
);

	always @(posedge nextByte) begin
		if (currentPackage == 1) begin
			case (currentByte)
				// byte.bit  4.0     4.1  4.2  4.3    4.4  4.5    4.6	4.7
				// button    Select  L3   R3   Start  Up   Right  Down  Left
				3: begin
					select   = ctrData[0];
					l3       = ctrData[1];
					r3       = ctrData[2];
					start    = ctrData[3];
					up       = ctrData[4];
					right    = ctrData[5];
					down     = ctrData[6];
					left     = ctrData[7];
				end

				// byte.bit  5.0  5.1  5.2  5.3  5.4       5.5     5.6  5.7
				// button    L2   R2   L1   R1   Triangle  circle  X    Square
				4: begin
					l2       = ctrData[0];
					r2       = ctrData[1];
					l1       = ctrData[2];
					r1       = ctrData[3];
					triangle = ctrData[4];
					circle   = ctrData[5];
					X        = ctrData[6];
					square   = ctrData[7];
				end

				// each Axis has a byte
				5: begin
					rightX   = ctrData[7:0];
				end
				6: begin
					rightY   = ctrData[7:0];
				end
				7: begin
					leftX    = ctrData[7:0];
				end
				8: begin
					leftY    = ctrData[7:0];
				end
				default: begin
					//just don't
				end

			endcase
		end
	end

endmodule