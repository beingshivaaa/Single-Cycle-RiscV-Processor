module Pcplus4_adder_tb();

//Input
reg [31:0] pc_out;

//Output
wire [31:0] PCPlus4;

Pcplus4_adder dut(pc_out,PCPlus4);

initial begin 
$dumpfile("dump.file");
$dumpvars;

pc_out<=32'b0;

#10 $finish();
end

always #2 pc_out<=~pc_out;

endmodule