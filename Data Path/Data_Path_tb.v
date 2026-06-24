module Data_Path_tb;

reg clk;
reg reset;

reg PCSrc;
reg RegWrite;
reg ALUSrc;
reg MemWrite;

reg [1:0] ResultSrc;
reg [1:0] ImmSrc;
reg [2:0] ALUControl;

wire Zero;

wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

Data_Path dut(
    .clk(clk),
    .reset(reset),

    .PCSrc(PCSrc),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),

    .ResultSrc(ResultSrc),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl),

    .Zero(Zero),

    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,Data_Path_tb);

    clk = 0;

    reset = 1;

    PCSrc = 0;
    RegWrite = 0;
    ALUSrc = 0;
    MemWrite = 0;

    ResultSrc = 2'b00;
    ImmSrc = 2'b00;
    ALUControl = 3'b000;

    #10;

    reset = 0;

    RegWrite = 1;
    ALUSrc = 1;
    ALUControl = 3'b000;

    #100;

    $finish;

end

endmodule