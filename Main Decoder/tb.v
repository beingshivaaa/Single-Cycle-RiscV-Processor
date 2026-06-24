module main_decoder_tb;

reg [6:0] opcode;
wire RegWrite;
wire [1:0] ImmSrc;
wire ALUSrc;
wire MemWrite;
wire [1:0] ResultSrc;
wire Branch;
wire [1:0] ALUOp;
wire Jump

main_decoder dut(opcode,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp); //Instantiation

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,main_decoder_tb);

opcode = 7'b0;

#10;
opcode=7'b0110011; //R-type instruction

#10;
opcode=7'b0010011; //ADDI instruction

#10;
opcode=7'b0100011;// STORE instruction

#20 $finish();

end

endmodule