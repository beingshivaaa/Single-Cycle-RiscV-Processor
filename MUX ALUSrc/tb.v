module ALUSrc_mux_tb;

reg [31:0] RD2; 
reg [31:0] ImmExt; 
reg ALUSrc;
wire [31:0] SrcB;

ALUSrc_mux dut(RD2,ImmExt,ALUSrc,SrcB);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0, ALUSrc_mux_tb);

RD2    = 32'd10;
ImmExt = 32'd100;

ALUSrc = 0;
#10;

ALUSrc = 1;
#10;

RD2    = 32'd55;
ImmExt = 32'd200;
#10;

ALUSrc = 0;
#10;

$finish;

end

endmodule