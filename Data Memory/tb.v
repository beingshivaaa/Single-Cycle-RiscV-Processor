module Data_Memory_tb;

//Inputs
reg clk,WE;
reg [31:0] A;
reg [31:0] WD;

//Outputs
wire [31:0] RD;

Data_Memory dut(clk,WE,A,WD,RD); //Instantiation

initial begin
 {clk,WE,A,WD}=0;
end

always #5 clk=~clk;

//testbench stimulus
initial begin

$dumpfile("dump.vcd");
$dumpvars(0,Data_Memory_tb);

#15;
//write operation
WE=1;
A=32'd4;
WD=32'hABCD5678;

#10;
//read operation
WE=0;
A=32'd4;

#20 $finish;

end

endmodule