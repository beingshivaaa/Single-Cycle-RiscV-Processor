# Single-Cycle RISC-V Processor in Verilog

## Overview

This project implements a 32-bit Single-Cycle RISC-V Processor in Verilog HDL based on the architecture described in *Digital Design and Computer Architecture: RISC-V Edition* by Sarah Harris and David Harris.

The processor supports instruction fetch, decode, execute, memory access, and write-back operations within a single clock cycle. The design was simulated and verified using Xilinx Vivado.

---

## Features

* 32-bit RISC-V Architecture
* Single-Cycle Datapath
* Modular Verilog Design
* Register File with 32 Registers
* Instruction Memory
* Data Memory
* Immediate Extension Unit
* Arithmetic Logic Unit (ALU)
* Main Decoder
* ALU Decoder
* Program Counter Logic
* Branch and Jump Support
* Result Write-Back Logic

---

## Supported Instructions

### R-Type

* ADD
* SUB
* AND
* OR
* SLT

### I-Type

* ADDI

### Memory Instructions

* LW
* SW

### Branch Instructions

* BEQ

### Jump Instructions

* JAL

---

## Datapath Components

* Program Counter
* PC+4 Adder
* PC Target Adder
* Instruction Memory
* Register File
* Immediate Generator
* ALU
* Data Memory
* ALUSrc Multiplexer
* PCSrc Multiplexer
* ResultSrc Multiplexer
* Control Unit

---

## Project Structure

```text
├── Program Counter
├── Instruction Memory
├── Register File
├── Imm Extend
├── Arithmetic Logic Unit
├── Main Decoder
├── ALU Decoder
├── ALU Control
├── Data Memory
├── MUX ALUSrc
├── MUX PCSrc
├── MUX ResultSrc
├── Data Path
├── top_processor.v
└── Testbenches
```

## Example Program Executed

```assembly
addi x1, x0, 5
addi x2, x0, 10
add  x3, x1, x2
sw   x3, 0(x0)
```

Expected Result:

```text
x1 = 5
x2 = 10
x3 = 15
MEM[0] = 15
```

Simulation results confirmed successful execution of the above program.

---

## Tools Used

* Verilog HDL
* Xilinx Vivado 2025.1
* GTKWave (during early verification)
* Visual Studio Code

---

## Reference

Sarah Harris and David Harris,
*Digital Design and Computer Architecture: RISC-V Edition*

---

## Future Improvements

* 5-Stage Pipelined Processor
* Hazard Detection Unit
* Forwarding Unit
* RISC-V RV32I Instruction Support
* FPGA Implementation
* Performance Evaluation and Benchmarking
