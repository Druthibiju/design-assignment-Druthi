BCD Adder

The presented SystemVerilog testbench is developed to verify the functionality of a BCD (Binary-Coded Decimal) adder. The testbench creates a simulation environment in which different input combinations are applied to the BCD adder, and the corresponding outputs are observed. The primary objective of the testbench is to ensure that the adder performs correct BCD addition and generates the appropriate carry output whenever BCD correction is required.

An interface named bcd_adder_if is used to group all the signals associated with the BCD adder. The interface contains two 4-bit input operands, A and B, a carry input Cin, a 4-bit sum output S, and a carry output Cout. Using an interface simplifies the connection between the testbench and the design under test (DUT) by encapsulating related signals into a single construct. This improves readability, reduces wiring complexity, and makes the design easier to maintain.

Inside the testbench module, local signals are declared to generate stimulus and capture outputs. Continuous assignments are used to connect these local signals to the corresponding interface signals. The BCD adder module is then instantiated as the DUT and connected through the interface signals. This arrangement allows the testbench to drive inputs and observe outputs while keeping the communication structure organized.

The stimulus generation is performed using an initial block. Three different test cases are applied to the DUT sequentially. In the first test case, the values 4 and 4 are added with a carry input of 0. This verifies the normal addition operation where no BCD correction is required. In the second test case, the values 5 and 5 are added, producing a decimal result of 10. Since the result exceeds the valid BCD digit range, the adder should perform BCD correction and generate an appropriate carry output. In the third test case, the values 9 and 9 are added along with a carry input of 1. This test validates the adder's behavior under maximum input conditions and confirms proper BCD correction and carry generation.

A separate initial block is used for monitoring the simulation results. The $monitor system task continuously displays the simulation time, input values, carry input, carry output, and sum output whenever any of these signals change. This real-time observation helps verify the correctness of the DUT and simplifies the debugging process by providing immediate feedback during simulation.

The simulation begins with the application of the first test vector and proceeds through the remaining test cases at intervals of 10 nanoseconds. As each input combination is applied, the DUT computes the corresponding BCD sum and carry values. The monitored outputs are displayed on the simulation console, allowing the designer to compare the observed results with the expected behavior. After all test cases have been executed and sufficient time has elapsed for observation, the simulation is terminated using the $finish system task.

Overall, this testbench provides a structured and efficient framework for validating a BCD adder design. By utilizing a SystemVerilog interface, organized stimulus generation, and continuous output monitoring, the testbench effectively verifies both standard addition operations and cases requiring BCD correction. This approach ensures that the BCD adder operates correctly under a variety of input conditions and serves as a reliable verification environment for the design.

Output waveform


<img width="1600" height="852" alt="image" src="https://github.com/user-attachments/assets/151671c3-b9cd-43ba-a903-519d20c79d86" />

