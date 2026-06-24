module ResultSrc_mux_tb;

// Inputs
reg [31:0] ALUResult;
reg [31:0] RD;
reg [31:0] PCPlus4;
reg [1:0] ResultSrc;

// Output
wire [31:0] Result;


ResultSrc_mux dut(ALUResult,RD,PCPlus4,ResultSrc,Result);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, ResultSrc_mux_tb);

    // Initialize inputs
    ALUResult = 32'hAAAA1111;
    RD        = 32'hBBBB2222;
    PCPlus4   = 32'hCCCC3333;

    // Select ALUResult
    ResultSrc = 2'b00;
    #10;

    // Select RD
    ResultSrc = 2'b01;
    #10;

    // Select PCPlus4
    ResultSrc = 2'b10;
    #10;

    // Default case
    ResultSrc = 2'b11;
    #10;

    $finish;

end

endmodule