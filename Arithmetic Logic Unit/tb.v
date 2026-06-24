module alu_tb;

// Inputs
reg [31:0] SrcA;
reg [31:0] SrcB;
reg [2:0] ALUControl;

// Outputs
wire [31:0] ALUResult;
wire Zero;


alu dut (SrcA,SrcB,ALUControl,ALUResult,Zero);

//testbench stimulus
initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, alu_tb);

    // Test ADD
    SrcA = 32'd10;
    SrcB = 32'd20;
    ALUControl = 3'b000;
    #10;

    // Test SUB
    SrcA = 32'd20;
    SrcB = 32'd10;
    ALUControl = 3'b001;
    #10;

    // Test SUB producing Zero
    SrcA = 32'd15;
    SrcB = 32'd15;
    ALUControl = 3'b001;
    #10;

    // Test AND
    SrcA = 32'hF0F0F0F0;
    SrcB = 32'h0F0F0F0F;
    ALUControl = 3'b010;
    #10;

    // Test OR
    SrcA = 32'hF0F0F0F0;
    SrcB = 32'h0F0F0F0F;
    ALUControl = 3'b011;
    #10;

    // Test SLT (true)
    SrcA = 32'd5;
    SrcB = 32'd10;
    ALUControl = 3'b101;
    #10;

    // Test SLT (false)
    SrcA = 32'd20;
    SrcB = 32'd10;
    ALUControl = 3'b101;
    #10;

    $finish;

end

endmodule
