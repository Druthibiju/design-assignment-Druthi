Block Memory Generator (Single-Port RAM) 

1. Introduction

A Block Memory Generator is a memory module used for storing and retrieving digital data. It is widely used in FPGA designs to implement RAM-based storage systems. The memory consists of multiple storage locations that can be accessed using address lines. Data can be written into memory during write operations and retrieved during read operations.
In this design, an 8-location memory is implemented, where each location stores 8 bits of data. The memory supports synchronous write operations, synchronous read operations, and an asynchronous active-low reset for memory initialization.

2. Objective

The objective of this design is to implement an 8×8 memory module using Verilog HDL, support data writing and reading through address lines, initialize memory using an asynchronous reset signal, and verify the functionality through simulation.

3. Design Description

The memory module consists of an array of eight 8-bit registers that act as memory locations. The memory is accessed through separate write and read address inputs. During a write operation, data present at the input is stored in the memory location specified by the write address. During a read operation, data stored at the specified read address is transferred to the output.
An active-low asynchronous reset is provided to initialize all memory locations to zero. This ensures that the memory starts from a known state before normal operation begins.

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/0c367866-d9df-478b-bfda-0f26ee5eda25" />


4. Input and Output Specification

Inputs

| Signal     | Width | Description                   |
| ---------- | ----- | ----------------------------- |
| clk        | 1-bit | Clock signal                  |
| arst       | 1-bit | Active-low asynchronous reset |
| wr_enb     | 1-bit | Write enable signal           |
| wr_address | 3-bit | Write address                 |
| rd_address | 3-bit | Read address                  |
| data_in    | 8-bit | Input data                    |


Outputs
| Signal   | Width | Description |
| -------- | ----- | ----------- |
| data_out | 8-bit | Output data |


5. Working Principle

The memory operates on the positive edge of the clock signal. When the asynchronous reset signal is asserted low, all memory locations are cleared and initialized to zero. This operation occurs immediately without waiting for a clock edge.
When reset is inactive and the write enable signal is high, the input data is stored in the memory location specified by the write address. This allows the memory to retain data until it is overwritten or reset.
When the write enable signal is low, the memory enters read mode. In this mode, the data stored at the location specified by the read address is transferred to the output. Thus, the module supports controlled switching between write and read operations.

6. Verilog Implementation Overview

The design uses a two-dimensional register array to represent memory locations. An always block sensitive to the positive edge of the clock and the negative edge of the reset signal controls all memory operations. A for-loop is used during reset to initialize all memory locations to zero. Write operations are performed when the write enable signal is active, while read operations occur when writing is disabled.

7. Testbench Description

The testbench verifies both write and read operations of the memory module. Initially, all signals are initialized and the reset signal is asserted to clear the memory contents. After reset is released, the write enable signal is activated and eight different data values are written sequentially into all memory locations.
Once all memory locations are filled, the write enable signal is disabled. The testbench then applies different read addresses one after another to retrieve the stored data. The output is monitored to verify that the values read from memory match the values previously written into each location.

8. Test Cases

Write Operations

| Address | Data Written |
| ------- | ------------ |
| 000     | 5B           |
| 001     | 4F           |
| 010     | 12           |
| 011     | 8A           |
| 100     | 15           |
| 101     | 1C           |
| 110     | 70           |
| 111     | 6D           |




Read Operations
| Address | Data Written |
| ------- | ------------ |
| 000     | 5B           |
| 001     | 4F           |
| 010     | 12           |
| 011     | 8A           |
| 100     | 15           |
| 101     | 1C           |
| 110     | 70           |
| 111     | 6D           |



9. Expected Output Behavior

After reset, all memory locations contain zero. During the write phase, data is stored at the specified addresses on each positive clock edge. During the read phase, the output reflects the data stored at the selected read address. The values retrieved from memory should exactly match the values that were previously written into the corresponding locations.

10. Simulation Procedure

The design is simulated using Vivado or another Verilog simulation tool. The memory module and its testbench are added to the project, and the testbench is selected as the top simulation module. Behavioral simulation is then executed. The waveform is observed to verify proper reset functionality, successful writing of data into memory, and correct retrieval of stored data during read operations.

11. Applications

Block memory modules are commonly used in FPGA and digital system designs for temporary data storage, buffering, lookup tables, processor memory, communication systems, and embedded applications. They form an essential component of memory-based architectures.

12. Advantages and Limitations

The primary advantage of the block memory generator is its ability to efficiently store and retrieve data using address-based access. It provides fast memory operations and can be easily integrated into larger digital systems. However, the memory size is fixed by design, and larger storage requirements would require additional memory resources.

13. Conclusion

The Block Memory Generator was successfully designed and verified using Verilog HDL. The simulation results confirm that the memory correctly performs write and read operations while supporting asynchronous reset functionality. The design demonstrates reliable storage and retrieval of data and serves as a fundamental building block for memory-based digital systems.


Output waveform

<img width="1108" height="581" alt="image" src="https://github.com/user-attachments/assets/1df3fc49-6dbe-4d20-b832-1968c9ce3282" />

