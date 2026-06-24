module PCTarget_adder_tb;

reg [31:0] pc_out;
reg [31:0] ImmExt;
wire [31:0] PCTarget;

PCTarget_adder dut(pc_out, ImmExt, PCTarget);

initial begin 
$dumpfile("dump.file");
$dumpvars;

pc_out<=1'b0;
ImmExt<=1'b0;

#10 $finish();
end

always #2 pc_out<=~pc_out;
always #2 ImmExt<=~ImmExt;

endmodule