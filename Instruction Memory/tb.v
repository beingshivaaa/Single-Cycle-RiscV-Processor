module instruction_mem_tb;

// Input
reg [31:0] A;

// Output
wire [31:0] RD;

// Instantiate the module under test
Instruction_Memory dut (
    .A(A),
    .RD(RD)
);

    // Testbench stimulus
    initial begin
        // Address initialization and read operations

        // Read instruction from address 0
        A = 32'h00000000;
        #10; 
        // Read instruction from address 1 (shift left by 2 for word address)
        A = 32'h00000001 << 2;
        #10; 
        // Read instruction from address 2 (shift left by 2 for word address)
        A = 32'h00000002 << 2;
        #10; 
        // Read instruction from address 3 (shift left by 2 for word address)
        A = 32'h00000003 << 2;
        #10; 

        // Add more test cases as needed

        // End simulation
        $finish;
    end

endmodule