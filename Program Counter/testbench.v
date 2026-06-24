module prog_counter_tb();

//Inputs
reg clk,rst;
reg [31:0] pc_in;

//Output
wire [31:0] pc_out;

prog_counter dut(clk,rst,pc_in,pc_out);

initial begin
    {clk,rst}=0;
end

always #5 clk=~clk;

initial begin
        // Initialize inputs
        rst = 1;
        pc_in = 32'h00000000;  // Initial PC value

        // Wait a few clock cycles
        #20;

        // Deasserted reset
        rst = 0;

        // Wait a few clock cycles to observe PC update
        #20;

        // Example: Change pc_in to test PC update
        pc_in = 32'h00000004;
        #20;

        // End simulation
        $finish;
    end

endmodule

