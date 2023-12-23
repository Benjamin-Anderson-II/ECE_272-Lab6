module VGAmux
	(input logic[3:0] d, 
	input  logic[1:0] s,
	output logic[3:0] q);
	
	assign q = (s[1]&&s[0]) ? d : 0;
endmodule
