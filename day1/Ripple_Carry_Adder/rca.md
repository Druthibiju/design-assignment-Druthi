Ripple Carry Adder (RCA)

1. Introduction

The Ripple Carry Adder (RCA) is a fundamental combinational circuit used for binary addition of multi-bit numbers. It is constructed by connecting multiple full adders in cascade, where each full adder processes a single bit and passes the carry to the next stage. The name “ripple” comes from the way the carry propagates sequentially from the least significant bit (LSB) to the most significant bit (MSB).
Although simple in design, the ripple carry adder is widely used in digital systems due to its low hardware complexity and ease of implementation.

2. Objective

The main objectives of this design are:

To design a 4-bit Ripple Carry Adder using Verilog HDL.
To perform binary addition of two 4-bit inputs.
To generate correct sum and carry outputs.
To verify the design using simulation.

3. Design Description

The Ripple Carry Adder is built using a series of full adders. Each full adder performs binary addition of two input bits along with a carry input.The carry output from one stage becomes the carry input for the next stage. This process continues until the final bit is processed.The design operates purely as a combinational circuit and does not require a clock signal.

4. Input and Output Specification

Inputs

| Signal | Width | Description         |
| ------ | ----- | ------------------- |
| a      | 4-bit | First binary input  |
| b      | 4-bit | Second binary input |
| cin    | 1-bit | Initial carry input |

outputs
| Signal | Width | Description               |
| ------ | ----- | ------------------------- |
| sum    | 4-bit | Result of binary addition |
| cout   | 1-bit | Final carry output        |


6. Working Principle

The Ripple Carry Adder operates based on full adder logic. Each full adder performs binary addition using the inputs A, B, and Cin. The sum is generated using the XOR operation, while the carry is generated using AND and OR operations. The addition begins from the least significant bit, and the carry generated from each stage is passed to the next stage.

Since the carry must propagate through all full adders, the final output is obtained only after the carry reaches the most significant bit. This sequential propagation introduces delay, which is the main limitation of the ripple carry adder.

7. Verilog Implementation Overview

The design is implemented using a ripple carry adder module that internally connects multiple full adders. Each stage handles one bit of the input operands and generates intermediate sum and carry signals. These carry signals are chained from one stage to the next. The final output consists of a 4-bit sum and a single carry-out bit. Since the circuit is purely combinational, no clock signal is required for its operation.

8. Testbench Description

The testbench is used to verify the correctness of the Ripple Carry Adder design. It applies different combinations of 4-bit input values along with carry-in values to test various addition scenarios. The testbench is purely combinational and does not use any clock signal. Inputs are changed at specific time intervals, and the outputs are observed in simulation to ensure correct functionality of the adder.

9.Simulation Procedure

The design is simulated using a Verilog simulator such as Vivado. First, a new project is created, and the design file containing the ripple carry adder is added. Then, the testbench file is included and set as the top module for simulation. After running behavioral simulation, the waveform is observed to verify the correctness of sum and carry outputs. The results confirm proper operation of the adder for all test cases.

Test cases

| A (4-bit) | B (4-bit) | Cin | Expected Sum | Cout |
| --------- | --------- | --- | ------------ | ---- |
| 0110      | 1000      | 1   | 1111         | 0    |
| 1001      | 0000      | 0   | 1001         | 0    |
| 0011      | 1001      | 1   | 1101         | 0    |
| 0010      | 0001      | 1   | 0100         | 0    |



Circuit diagram

<img width="1024" height="502" alt="image" src="https://github.com/user-attachments/assets/227d01de-d4fd-47b8-9f40-3acb62bcc105" />


Output waveform


<img width="1079" height="554" alt="Screenshot 2026-06-10 190211" src="https://github.com/user-attachments/assets/076071fb-5d32-4cf9-9d73-03d763dfe78c" />

