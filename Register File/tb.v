module register_file_tb;

//Inputs
reg clk;
reg [4:0] A1;
reg [4:0] A2;
reg [4:0] A3;
reg WE3;
reg [31:0] WD3;

//Outputs
wire [31:0] RD1;
wire [31:0] RD2;

register_file dut (.WE3(WE3), .clk(clk), .A1(A1), .A2(A2), .A3(A3), .WD3(WD3), .RD1(RD1), .RD2(RD2));

initial begin
    {clk,A1,A2,A3,WE3,WD3}=0;
end

always #5 clk=~clk;

//testbench stimulus
initial begin

$dumpfile("dump.vcd");
$dumpvars(0,register_file_tb);

#15;
//Writing 100 into x5 register
WE3=1;
A3=5'd5;
WD3=32'd100;

#10;

WE3=0; //Stop Writing
A1=5'd5;//Read from x5

#10;
//Writing 200 into x10 register
WE3=1;
A3=5'd10;
WD3=32'd200;

#10;

WE3=0; //Stop Writing
A1=5'd10;//Read from x10

#10;
//Testing if data gets written into x0 register
WE3 = 1;
A3  = 5'd0;
WD3 = 32'd999;

#10 WE3=0;
A2=5'd0;

#10 $finish;
end


endmodule