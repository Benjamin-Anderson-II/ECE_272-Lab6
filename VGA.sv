module VGA (
	input  logic clk,
	input  logic rst,
	input  logic[1:0] R,
	input  logic[1:0] G,
	input  logic[1:0] B,
	output logic Hsync,
	output logic Vsync,
	output logic[3:0] outR,
	output logic[3:0] outG,
	output logic[3:0] outB);
	
	logic HDisplay;
	logic VDisplay;
	
	logic[3:0] Rlong;
	logic[3:0] Glong;
	logic[3:0] Blong;
	
	logic clkShort;
	
	divBy2 clkMod(clk, rst, clkShort);
	
	RGB_Decoder RedDecode(R[1:0], Rlong[3:0]);
	RGB_Decoder GreenDecode(G[1:0], Glong[3:0]);
	RGB_Decoder BlueDecode(B[1:0], Blong[3:0]);
	
	VGAmux Rmux(Rlong[3:0], {HDisplay, VDisplay}, outR[3:0]);
	VGAmux Gmux(Glong[3:0], {HDisplay, VDisplay}, outG[3:0]);
	VGAmux Bmux(Blong[3:0], {HDisplay, VDisplay}, outB[3:0]);
	
	SyncCount s(clkShort, rst, Hsync, Vsync, HDisplay, VDisplay);
	
endmodule

