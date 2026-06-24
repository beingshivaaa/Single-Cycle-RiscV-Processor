 module control_unit_tb;

// Inputs
reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
reg Zero;

// Outputs
wire PCSrc;
wire Jump;
wire [2:0] ALUControl;
wire RegWrite;
wire [1:0] ImmSrc;
wire ALUSrc;
wire MemWrite;
wire ResultSrc;
wire Branch;

//Instantiation
control_unit dut(
    opcode,
    funct3,
    funct7,
    Zero,
    PCSrc,
    Jump,
    ALUControl,
    RegWrite,
    ImmSrc,
    ALUSrc,
    MemWrite,
    ResultSrc,
    Branch
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, control_unit_tb);

    //lw
    opcode = 7'b0000011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    Zero   = 0;
    #10;

    //sw
    opcode = 7'b0100011;
    #10;

    //add
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #10;

    //sub
    opcode = 7'b0110011;
    funct3 = 3'b000;
    funct7 = 7'b0100000;
    #10;

    //and
    opcode = 7'b0110011;
    funct3 = 3'b111;
    funct7 = 7'b0000000;
    #10;

    //or
    opcode = 7'b0110011;
    funct3 = 3'b110;
    funct7 = 7'b0000000;
    #10;

    //beq not taken
    opcode = 7'b1100011;
    Zero   = 0;
    #10;

    //beq taken
    opcode = 7'b1100011;
    Zero   = 1;
    #10;

    $finish;

end

initial begin

$monitor(
"t=%0t opcode=%b funct3=%b funct7=%b Zero=%b | RegWrite=%b ALUSrc=%b MemWrite=%b ResultSrc=%b Branch=%b ALUControl=%b PCSrc=%b",
$time,
opcode,
funct3,
funct7,
Zero,
RegWrite,
ALUSrc,
MemWrite,
ResultSrc,
Branch,
ALUControl,
PCSrc
);

end

endmodule