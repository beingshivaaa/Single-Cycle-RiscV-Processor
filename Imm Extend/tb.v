module imm_extend_tb;

//Inputs
reg [31:7]instruction;
reg [1:0]ImmSrc;

//Output
wire [31:0]ImmExt;

imm_extend dut(instruction,ImmSrc,ImmExt);

//Testbench Stimulus
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);

        instruction = 25'b0;
        ImmSrc = 2'b00;

        // Test case for I-type
        #10 instruction = 25'b1000000000000000000000000; ImmSrc = 2'b00; // Sign-extend a negative value
        #10 instruction = 25'b0000000000000000000000000; ImmSrc = 2'b00; // Sign-extend a positive value
        
        // Test case for S-type
        #10 instruction = 25'b1000000000000000000000000; ImmSrc = 2'b01;
        #10 instruction = 25'b0000000000000000000000000; ImmSrc = 2'b01;

        // Test case for B-type
        #10 instruction = 25'b1000000000000000000000000; ImmSrc = 2'b10;
        #10 instruction = 25'b0000000000000000000000000; ImmSrc = 2'b10;

        // Test case for J-type
        #10 instruction = 25'b1000000000000000000000000; ImmSrc = 2'b11;
        #10 instruction = 25'b0000000000000000000000000; ImmSrc = 2'b11;

        #10 $finish();
end