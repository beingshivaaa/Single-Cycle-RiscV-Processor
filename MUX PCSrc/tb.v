module PCSrc_mux_tb;

reg PCSrc;
reg [31:0] PCPlus4;
reg [31:0] PCTarget;
wire [31:0] PCNext;

PCSrc_mux dut(PCSrc,PCPlus4,PCTarget,PCNext);

initial begin 
$dumpfile("dump.file");
$dumpvars;

PCPlus4<=32'b0;
PCTarget<=32'b0;
PCSrc<=1'b0;

#10 $finish();
end

always #2 PCPlus4<=~PCPlus4;
always #1.2 PCTarget<=~PCTarget;
always #3 PCSrc<=~PCSrc;

endmodule