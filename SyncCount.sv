module SyncCount
	(input logic clk,
	input  logic rst,
	output logic Hsync,
	output logic Vsync,
	output logic Hdisplay,
	output logic Vdisplay);
	
	logic[9:0] Hcount; // 800
	logic[9:0] Vcount; // 525
	always_ff @(posedge clk, negedge rst) begin
		if(!rst) begin 
			Hcount <= 0;
			Vcount <= 0;
		end else begin
			Hsync <= (Hcount < 96) ? 0 : 1;
			if(Hcount < 144 || Hcount >= 784)
				Hdisplay <= 0;
			else
				Hdisplay <= 1;
			Hcount <= Hcount + 1;
			if(Hcount >= 800) begin
				Hcount <= 0;
				// Vertical Logic
				Vsync <= (Vcount < 2) ? 0 : 1;
				if(Vcount < 35 || Vcount >= 515)
					Vdisplay <= 0;
				else
					Vdisplay <= 1;
				Vcount <= Vcount + 1;
				if(Vcount >= 525)
					Vcount <= 0;
			end
		end
	end
endmodule
