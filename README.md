# Single-Cycle RISC-V Processor with GNU Toolchain Integration

A **32-bit Single-Cycle RISC-V Processor** implemented in Verilog HDL based on *Digital Design and Computer Architecture: RISC-V Edition* by Sarah Harris and David Harris.

Unlike conventional educational implementations where instructions are manually hardcoded into the instruction memory, this project integrates the **GNU RISC-V Toolchain**, enabling assembly programs to be compiled into machine code and automatically loaded into the processor for simulation.

---

## Features

### Processor Architecture

- 32-bit RV32I Single-Cycle Processor
- Modular Verilog Design
- Separate Instruction and Data Memory
- 32 × 32-bit Register File
- Immediate Generation Unit
- ALU
- Main Decoder
- ALU Decoder
- Program Counter Logic
- Branch Target Computation
- Memory Read/Write Support
- Simulation verified using Xilinx Vivado

---

## Supported Instructions

### R-Type

- ADD
- SUB
- AND
- OR
- SLT

### I-Type

- ADDI
- LW

### S-Type

- SW

### B-Type

- BEQ

### J-Type

- JAL

---

# GNU Toolchain Integration

Instead of manually writing hexadecimal machine instructions inside the instruction memory module, this project uses the **GNU RISC-V Toolchain** to automatically generate executable machine code.

### Workflow

```
Assembly Program (.s)
        │
        ▼
GNU RISC-V Assembler
        │
        ▼
Object File (.o)
        │
        ▼
GNU Linker
        │
        ▼
Executable (.elf)
        │
        ▼
objcopy / objdump
        │
        ▼
Machine Code (.hex)
        │
        ▼
Instruction Memory ($readmemh)
        │
        ▼
Single-Cycle RISC-V Processor
```

---

## Advantages of the Toolchain

- Eliminates manual hexadecimal instruction entry
- Supports larger assembly programs
- Faster software testing
- Simplifies debugging
- Mimics an actual processor development workflow
- Enables rapid verification using different assembly programs

---

## Instruction Memory

The instruction memory is initialized using Verilog's `$readmemh` system task.

```verilog
initial begin
    $readmemh("program.hex", mem);
end
```

The generated `program.hex` file is automatically loaded during simulation.

---

## Datapath Overview

```
                  Program Counter
                        │
                        ▼
               Instruction Memory
                        │
                        ▼
                  Control Unit
                        │
                        ▼
                 Register File
                        │
                        ▼
                       ALU
                        │
              ┌─────────┴─────────┐
              ▼                   ▼
        Data Memory          PC Update Logic
              │
              ▼
          Write Back
```

---

## Verification

The processor was verified using multiple assembly programs generated through the GNU RISC-V Toolchain.

Verification included:

- Arithmetic Instructions
- Logical Instructions
- Memory Operations
- Branch Instructions
- Jump Instructions
- Register Write-Back
- Data Memory Read/Write

Waveforms were analyzed in Xilinx Vivado to verify correct processor operation.

---

## Project Structure

```
├── Program Counter
├── Instruction Memory
├── Data Memory
├── Register File
├── ALU
├── Immediate Generator
├── Main Decoder
├── ALU Decoder
├── Control Unit
├── Datapath
├── Top Processor
├── Testbench
├── program.s
├── program.hex
└── GNU Toolchain Scripts
```

---

## Tools Used

- Verilog HDL
- GNU RISC-V Toolchain
- Xilinx Vivado
- Visual Studio Code
- Git
- GitHub

---

## Future Improvements

- 5-Stage Pipeline Implementation
- Hazard Detection
- Data Forwarding
- Branch Prediction
- Secure Memory Encryption
- AES-Based Hardware Security
- Memory-Mapped Peripherals

---

## References

- David Harris & Sarah Harris, *Digital Design and Computer Architecture: RISC-V Edition*
- RISC-V Unprivileged ISA Specification

---

## Author

**Y. Shiva Rao**

B.Tech Electronics and Communication Engineering

National Institute of Technology Silchar

---

## Project Highlights

- ✔ 32-bit Single-Cycle RISC-V Processor
- ✔ Modular Verilog RTL Design
- ✔ GNU RISC-V Toolchain Integration
- ✔ Automatic Instruction Memory Initialization
- ✔ Assembly-to-Hardware Workflow
- ✔ Functional Verification using Xilinx Vivado
