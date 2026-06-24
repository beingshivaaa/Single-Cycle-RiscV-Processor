module alu_decoder_tb;

reg [1:0] ALUOp;
reg [2:0] funct3;
reg [6:0] funct7;
wire [2:0] ALUControl;

alu_decoder dut(ALUOp,funct3,funct7,ALUControl);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,alu_decoder_tb);

//lw/sw -> ADD
ALUOp  = 2'b00;
funct3 = 3'b000;
funct7 = 7'b0000000;
#10;

//beq-> SUB
ALUOp  = 2'b01;
funct3 = 3'b000;
funct7 = 7'b0000000;
#10;

// ADD
ALUOp  = 2'b10;
funct3 = 3'b000;
funct7 = 7'b0000000;
#10;

//SUB
ALUOp  = 2'b10;
funct3 = 3'b000;
funct7 = 7'b0100000;
#10;

//SLT
ALUOp  = 2'b10;
funct3 = 3'b010;
funct7 = 7'b0000000;
#10;

//lw/sw -> ADD
ALUOp  = 2'b10;
funct3 = 3'b110;
funct7 = 7'b0000000;
#10;

//lw/sw -> ADD
ALUOp  = 2'b10;
funct3 = 3'b111;
funct7 = 7'b0000000;
#10;

$finish;

end

endmodule
