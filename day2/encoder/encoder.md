4×2 Encoder


1. Introduction

The 4×2 Encoder is a combinational logic circuit that converts a 4-line input into a 2-bit binary output. It is a basic digital system component used for data compression, where only one input line is active at a time. The encoder produces a binary code corresponding to the active input line, thereby reducing multiple input lines into fewer output bits.

2. Objective

The objective of this design is to implement a 4×2 Encoder using Verilog HDL, map one-hot input signals to their corresponding binary outputs, and verify the functionality through simulation.

3. Design Description

The 4×2 Encoder takes four input lines and generates a 2-bit binary output. Only one input is assumed to be high at a time. Based on the active input line, the output is generated using a case statement inside a combinational always block. If no valid input is active, the output defaults to a predefined value.

<img width="492" height="169" alt="image" src="https://github.com/user-attachments/assets/e8abb84e-d4a0-4cae-a151-17a89e09ccc1" />


4. Input and Output Specification

Inputs
| Signal | Width | Description                   |
| ------ | ----- | ----------------------------- |
| d      | 4-bit | Input lines (one-hot encoded) |


Outputs
| Signal | Width | Description           |
| ------ | ----- | --------------------- |
| b      | 2-bit | Binary encoded output |


5. Working Principle

The encoder works by detecting which one of the four input lines is active. Each active input corresponds to a unique 2-bit binary code. The mapping is performed using a combinational case statement that continuously monitors the input vector. If input 0001 is active, the output is 00. If 0010 is active, the output is 01. If 0100 is active, the output is 10. If 1000 is active, the output is 11.
If none or multiple inputs are active, the default case assigns a safe output value to avoid undefined behavior.

6. Verilog Implementation Overview

The encoder is implemented using an always @(*) block, making it a purely combinational circuit. The case statement evaluates the input vector and assigns the corresponding binary output. This ensures real-time encoding of input signals without the need for a clock signal.

7. Testbench Description

The testbench verifies the encoder functionality by applying different one-hot input combinations. Each input is applied sequentially with a delay of 10 time units. The $monitor statement is used to continuously display the output value whenever it changes. This helps in observing the correct encoding behavior for each input condition.

8. Test Cases

| Input (d) | Expected Output (b) |
| --------- | ------------------- |
| 0001      | 00                  |
| 0010      | 01                  |
| 0100      | 10                  |
| 1000      | 11                  |


9. Expected Output Behavior

The encoder produces a 2-bit binary output corresponding to the active input line. When input 0001 is applied, output becomes 00, and similarly for other valid inputs. The output updates immediately with any change in input since the design is combinational. If no valid input is given, the default output is produced.

10. Simulation Procedure

The design is simulated using a Verilog simulation tool such as Vivado. First, a project is created and the encoder design file is added. Then the testbench file is included as the simulation source. After running behavioral simulation, the waveform and console output are observed to verify correct encoding behavior.

11. Applications

The 4×2 Encoder is used in digital systems for data compression, communication systems, priority encoding systems, and processor control logic. It is also used in multiplexing and signal encoding applications.

12. Advantages and Limitations

The main advantage of the encoder is its simple and efficient conversion of multiple input lines into fewer output bits. However, a major limitation is that it assumes only one input is active at a time; multiple active inputs can lead to incorrect outputs unless priority encoding is implemented.

13. Conclusion

The 4×2 Encoder was successfully designed and verified using Verilog HDL. The simulation results confirm correct encoding of one-hot input signals into corresponding 2-bit binary outputs. The design operates as a combinational circuit and responds instantly to input changes.

Output waveform


<img width="1054" height="502" alt="image" src="https://github.com/user-attachments/assets/67dda32b-0fab-41da-8eb7-5abbf752b16d" />

