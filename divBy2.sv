module divBy2 (
	input  logic clk,
	input  logic rst,
	output logic q
);
	logic  loop;
	assign loop = 1;
	always_ff @(posedge clk, negedge rst)
		q <= (!rst) ? 0 : (~q & loop | q & ~loop);
endmodule
