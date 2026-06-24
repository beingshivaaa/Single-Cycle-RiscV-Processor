module instruction_mem(
    input [31:0] A,
    output reg [31:0] RD
);

//Instruction memory array(ROM)
reg [31:0] mem[0:63];

integer i;

//Initialize the memory with program instructions(Hex form)
initial begin
    mem[0] = 32'h00500093;  // li x1, 5 (addi x1, x0, 5)
    mem[1] = 32'h00A00113;  // li x2, 10 (addi x2, x0, 10)
    mem[2] = 32'h002081B3;  // add x3, x1, x2
    mem[3] = 32'h00300023;  // sw x3, 0(x0)
    
    for(i=4;i<64;i=i+1) 
        mem[i] = 32'h00000013;   // addi x0,x0,0 (NOP)
end

//Reads the instruction corresponding to given address
always@(*) begin
    RD= mem[A[31:2]]; //Addresses being multiple of 4 contains 0 in last 2 bits(so we avoid them)
end

endmodule