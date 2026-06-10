SR Flip-Flop (SRFF)

1. Introduction

The SR Flip-Flop (Set-Reset Flip-Flop) is a fundamental sequential memory element used to store a single bit of data. It has two control inputs, Set (S) and Reset (R), which determine the output state. The SR Flip-Flop is widely used in digital electronics for memory storage and control applications. In this design, the flip-flop is triggered on the positive edge of the clock and includes an asynchronous reset to initialize the output.

2. Objective

The objective of this design is to implement an SR Flip-Flop using Verilog HDL, simulate its behavior, and verify all possible input conditions including set, reset, hold, and invalid states. The design ensures correct state transitions based on the input combination of S and R.

3. Design Description

The SR Flip-Flop is designed using a positive edge-triggered always block. The reset condition is checked first, and if active, the output is initialized to a known state. When reset is inactive, the outputs depend on the values of S and R inputs. The design follows standard SR flip-flop behavior where different input combinations produce different output states.

<img width="1409" height="648" alt="image" src="https://github.com/user-attachments/assets/29bb47a9-8bfd-41cc-b859-d4e460b426d5" />


4. Input and Output Specification

Inputs

| Signal | Width | Description  |
| ------ | ----- | ------------ |
| s      | 1-bit | Set input    |
| r      | 1-bit | Reset input  |
| rst    | 1-bit | Reset signal |
| clk    | 1-bit | Clock input  |



Outputs

| Signal | Width | Description       |
| ------ | ----- | ----------------- |
| q      | 1-bit | Output state      |
| qb     | 1-bit | Complement output |



5. Working Principle

The SR Flip-Flop operates based on the values of Set (S) and Reset (R) inputs at every positive edge of the clock signal. When reset is active, the output is forced to a known state. When reset is inactive, the flip-flop behaves according to the SR truth table. If S=0 and R=0, the previous state is retained. If S=1 and R=0, the output is set to 1. If S=0 and R=1, the output is reset to 0. When both S and R are 1, the condition is considered invalid, and the output becomes undefined.

6. Verilog Implementation Overview

The SR Flip-Flop is implemented using an always block sensitive to the positive edge of the clock. Inside the block, the reset condition is checked first. If reset is active, the outputs are initialized. Otherwise, the behavior depends on the combination of S and R inputs. The design explicitly handles all cases including hold, set, reset, and invalid conditions. The complement output is generated based on the main output.

7. Testbench Description

The testbench is used to verify the SR Flip-Flop functionality by applying different combinations of S and R inputs. A clock signal is generated with a fixed time period of 10 time units. Initially, reset is activated to initialize the output. After reset is deactivated, different input combinations are applied sequentially to test all functional states of the flip-flop. The simulation helps verify correct behavior for set, reset, hold, and invalid conditions.

8. Test Cases

| Time (ns) | S | R | Reset | Expected Q | Expected Q̅ |
| --------- | - | - | ----- | ---------- | ----------- |
| 0         | X | X | 1     | 0          | 1           |
| 10        | 0 | 0 | 0     | Hold       | Hold        |
| 20        | 0 | 1 | 0     | 0          | 1           |
| 30        | 1 | 0 | 0     | 1          | 0           |
| 40        | 1 | 1 | 0     | Undefined  | Undefined   |



9. Expected Output Behavior

The SR Flip-Flop correctly responds to all input combinations at the positive edge of the clock. When reset is active, the output is forced to a known state. When reset is inactive, the flip-flop stores data based on S and R inputs. The hold condition preserves the previous state, the set condition assigns logic 1, and the reset condition assigns logic 0. The invalid condition (S=1, R=1) leads to an undefined state.

10. Simulation Procedure

The design is simulated using a Verilog simulation tool such as Vivado. A project is created and both the design file and testbench file are added. The testbench is set as the top module. After running behavioral simulation, the waveform is observed to verify correct operation under all input conditions including reset, set, reset, hold, and invalid states.

11. Applications

The SR Flip-Flop is used in basic memory storage circuits, control systems, latches, registers, and finite state machines. It is also used in digital systems where simple set-reset control logic is required.

12. Advantages and Limitations

The SR Flip-Flop is simple to design and easy to implement in digital circuits. It provides basic memory functionality and is widely used in sequential logic design. However, its main limitation is the invalid state condition when both S and R are high, which can lead to undefined behavior.

13. Conclusion

The SR Flip-Flop was successfully designed and verified using Verilog HDL. The simulation results confirm correct operation for all input combinations including set, reset, hold, and invalid conditions. The design demonstrates the fundamental behavior of sequential logic elements used in digital systems.

Output waveform


<img width="1069" height="493" alt="image" src="https://github.com/user-attachments/assets/44a9a1f3-c0c9-432a-92a1-c08bc72eda52" />

