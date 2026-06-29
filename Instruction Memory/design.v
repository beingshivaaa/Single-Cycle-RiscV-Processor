module instruction_mem(
    input [31:0] A,
    output reg [31:0] RD
);

//Instruction memory array(ROM)
reg [31:0] mem[0:63];

integer i;

//Initialize the memory with program instructions(Hex form)
//initial begin

////              Test Programs -->

////    (1)  
////    mem[0] = 32'h00500093;  // li x1, 5 (addi x1, x0, 5)
////    mem[1] = 32'h00A00113;  // li x2, 10 (addi x2, x0, 10)
////    mem[2] = 32'h002081B3;  // add x3, x1, x2
////    mem[3] = 32'h00300023;  // sw x3, 0(x0)

////    (2)    
////    mem[0] = 32'h00F00093;   // addi x1,x0,15
////    mem[1] = 32'h00800113;   // addi x2,x0,8
////    mem[2] = 32'h002081B3;   // add x3,x1,x2
////    mem[3] = 32'h40208233;   // sub x4,x1,x2
////    mem[4] = 32'h0020F2B3;   // and x5,x1,x2
////    mem[5] = 32'h0020E333;   // or x6,x1,x2
////    mem[6] = 32'h0020A3B3;   // slt x7,x1,x2 

////    (3)
////    mem[0] = 32'h00A00093;   // addi x1,x0,10
////    mem[1] = 32'h00A00113;   // addi x2,x0,10
////    mem[2] = 32'h00208463;   // beq x1,x2,+8
////    mem[3] = 32'h06300193;   // addi x3,x0,99
////    mem[4] = 32'h00100193;   // addi x3,x0,1
    
////    (4)
////    mem[0] = 32'h008002EF;   // jal x5,+8
////    mem[1] = 32'h06300093;   // addi x1,x0,99
////    mem[2] = 32'h03200113;   // addi x2,x0,50

//    mem[0] = 32'h00A00093;   // addi x1,x0,10
//    mem[1] = 32'h00500113;   // addi x2,x0,5
//    mem[2] = 32'h002081B3;   // add x3,x1,x2
//    mem[3] = 32'h40218233;   // sub x4,x3,x2
//    mem[4] = 32'h0041E2B3;   // or x5,x3,x4
//    mem[5] = 32'h0012F333;   // and x6,x5,x1
//    mem[6] = 32'h00602023;   // sw x6,0(x0)
//    mem[7] = 32'h00002383;   // lw x7,0(x0)
    
//    for(i=8;i<64;i=i+1) 
//        mem[i] = 32'h00000013;   // addi x0,x0,0 (NOP)
//end

initial begin
    
    for(i=0;i<64;i=i+1)
        mem[i] = 32'h00000013;   // addi x0,x0,0 (NOP)
        
    $readmemh("program.hex",mem);
end

//Reads the instruction corresponding to given address
always@(*) begin
    RD= mem[A[31:2]]; //Addresses being multiple of 4 contains 0 in last 2 bits(so we avoid them)
end

endmodule
