module RGB_Decoder(
	input  logic[1:0] d,
	output logic[3:0] q);
	
	assign q[3:0]={d, d};
endmodule
	