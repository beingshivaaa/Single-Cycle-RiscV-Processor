module Data_Path(
    input clk, reset,

    //Control signals from Control Unit
    input PCSrc,Jump,RegWrite,ALUSrc,
    input MemWrite, 
    input [1:0] ResultSrc,
    input [1:0] ImmSrc,
    input [2:0] ALUControl,
    
    //Outputs to Control Unit
    output Zero,
    output [6:0] opcode,
    output [2:0] funct3,
    output [6:0] funct7
);
    wire [31:0] PC;
    wire [31:0] PCNext;
    wire [31:0] PCPlus4;
    wire [31:0] PCTarget;

    wire [31:0] Instr;

    wire [31:0] RD1;
    wire [31:0] RD2;

    wire [31:0] SrcB;
    wire [31:0] ImmExt;

    wire [31:0] ALUResult;

    wire [31:0] ReadData;

    wire [31:0] Result;

    // PC Logic flow
    prog_counter pc(clk, reset, PCNext, PC);

    instruction_mem im(PC,Instr);

    assign opcode = Instr[6:0];
    assign funct3 = Instr[14:12];
    assign funct7 = Instr[31:25];

    Pcplus4_adder a1(PC, PCPlus4);

    imm_extend e(Instr[31:7], ImmSrc, ImmExt);

    PCTarget_adder a2(PC, ImmExt, PCTarget);
    PCSrc_mux m1(PCSrc,PCPlus4, PCTarget, PCNext);
    
    // Register File Logic Flow
    register_file rf(clk, Instr[19:15], Instr[24:20], Instr[11:7],RegWrite, Result, RD1, RD2);
    
    
    // ALU Logic
    ALUSrc_mux m2(RD2, ImmExt, ALUSrc, SrcB);
    alu ob(RD1, SrcB, ALUControl,ALUResult,Zero);
    
    // Data Memory Logic
    Data_Memory dm(clk, MemWrite, ALUResult, RD2, ReadData);
    
    // MUX for ResultSrc
    ResultSrc_mux m3(ALUResult, ReadData, PCPlus4, ResultSrc, Result);
    
endmodule