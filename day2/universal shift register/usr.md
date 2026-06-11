Universal Shift Register (USR)


1. Introduction

The Universal Shift Register (USR) is a sequential circuit capable of performing multiple data operations such as shifting left, shifting right, parallel loading, and holding data. It is a highly flexible register used in digital systems for data storage and data movement operations. The behavior of the register is controlled using mode selection inputs, making it suitable for various applications like arithmetic operations, data transfer, and communication systems.

2. Objective

The objective of this design is to implement a 4-bit Universal Shift Register using Verilog HDL, support multiple operating modes including shift left, shift right, parallel load, and hold, and verify its functionality through simulation.

3. Design Description

The Universal Shift Register is designed using a 4-bit internal register (temp) that stores intermediate and final values. The operation of the register is controlled using a 2-bit mode input (mod). Depending on the selected mode, the register performs shifting, loading, or holding operations. A synchronous reset is used to initialize all outputs to zero.
The design operates on the positive edge of the clock signal, ensuring synchronized data movement.

<img width="898" height="588" alt="image" src="https://github.com/user-attachments/assets/1c080bb0-854f-4783-bc45-46ba6aa2f44c" />


4. Input and Output Specification

Inputs
| Signal | Width | Description          |
| ------ | ----- | -------------------- |
| clk    | 1-bit | Clock signal         |
| rst    | 1-bit | Reset signal         |
| sin    | 1-bit | Serial input         |
| pin    | 4-bit | Parallel input       |
| mod    | 2-bit | Mode selection input |
| load   | 1-bit | Load control signal  |



Outputs
| Signal | Width | Description     |
| ------ | ----- | --------------- |
| sout   | 1-bit | Serial output   |
| pout   | 4-bit | Parallel output |


5. Working Principle

The Universal Shift Register operates based on the selected mode input. When reset is active, all outputs are cleared to zero. In shift-right mode, the register shifts data to the right and inserts the serial input at the MSB position, while the LSB is output as serial output. In shift-left mode, the register shifts data to the left and inserts the serial input at the LSB position. In parallel load mode, data is loaded directly into the register when the load signal is active. In hold mode, the register retains its previous value unless a load operation is triggered.

6. Verilog Implementation Overview

The design is implemented using a sequential always block triggered on the positive edge of the clock signal. A case statement is used to select between different operating modes. The internal register temp stores intermediate values during shifting and loading operations. Based on the selected mode, the register either shifts data, loads parallel input, or retains its previous state. The outputs sout and pout are updated accordingly.

7. Testbench Description

The testbench verifies all operating modes of the Universal Shift Register. A clock signal with a period of 10 time units is generated. Initially, reset is applied to initialize the register. After reset is released, different mode combinations are tested sequentially, including shift-right, shift-left, parallel load, and hold operations. Serial and parallel inputs are varied during simulation to observe correct behavior of the register under different conditions.

8. Test Cases

| Mode | Operation                  | Input Condition | Expected Behavior             |
| ---- | -------------------------- | --------------- | ----------------------------- |
| 00   | Shift Right                | sin input used  | Right shift with serial input |
| 01   | Shift Right (alt behavior) | sin input used  | Right shift operation         |
| 10   | Shift + Load               | load=1 / load=0 | Parallel load or shift        |
| 11   | Hold / Load                | load=1          | Hold or direct load           |



9. Expected Output Behavior

The Universal Shift Register correctly performs all four operations based on mode selection. In shift modes, data moves left or right with serial input inserted appropriately. In parallel load mode, the register directly stores the input data. In hold mode, the previous value is maintained unless a load operation is triggered. The serial output reflects the shifted-out bit during shifting operations.

10. Simulation Procedure

The design is simulated using a Verilog simulation tool such as Vivado. A project is created and both the design file and testbench file are added. The testbench is selected as the top module for simulation. After running behavioral simulation, waveform outputs are observed to verify correct shifting, loading, and holding operations across all modes.

11. Applications

The Universal Shift Register is widely used in digital systems such as data communication, arithmetic operations, CPU registers, serial-to-parallel and parallel-to-serial conversion, and memory data handling systems.

12. Advantages and Limitations

The main advantage of the Universal Shift Register is its flexibility, as it supports multiple operations within a single circuit. However, its complexity is higher compared to simple shift registers due to additional control logic for mode selection.

13. Conclusion

The Universal Shift Register was successfully designed and verified using Verilog HDL. The simulation results confirm correct operation in all modes including shifting, parallel loading, and holding. The design demonstrates efficient multi-functional data handling capability in sequential digital systems.

Output  waveform
<img width="1075" height="548" alt="image" src="https://github.com/user-attachments/assets/e7ee9b51-cf4a-4c97-95d0-dea3383469a5" />

