BCD Adder


1. Introduction

The Binary Coded Decimal (BCD) Adder is a combinational arithmetic circuit used to add two 4-bit BCD numbers and produce a valid BCD result. Since binary addition can sometimes generate results greater than 9 (1001 in binary), such outputs are invalid in BCD representation. To correct this, a correction logic is applied by adding 6 (0110) whenever the result exceeds the valid BCD range.
This design uses ripple carry adders as the core addition unit along with correction logic to ensure valid BCD output.

2. Objective

The objective of this design is to implement a BCD Adder using Verilog HDL, perform binary addition of two 4-bit inputs, detect invalid BCD results, apply correction using 0110, and verify the functionality through simulation.

3. Design Description

The BCD Adder is implemented using two ripple carry adders. The first ripple carry adder performs binary addition of the inputs a and b along with carry-in cin, producing an intermediate sum s and carry e1. This intermediate result may not always be a valid BCD number.
To detect invalid BCD results, correction logic is applied. If the sum exceeds 9 or if a carry is generated, a correction signal e2 becomes active. Based on this signal, the correction value 0110 is added to the intermediate sum using a second ripple carry adder to produce the final BCD output.

CIRCUIT DIAGRAM

<img width="2048" height="1088" alt="image" src="https://github.com/user-attachments/assets/117a1ec3-4c26-4cea-8080-3c9e66f33c8e" />


4. Input and Output Specification
   
Inputs
| Signal | Width | Description      |
| ------ | ----- | ---------------- |
| a      | 4-bit | First BCD input  |
| b      | 4-bit | Second BCD input |
| cin    | 1-bit | Carry input      |


Outputs
| Signal | Width | Description        |
| ------ | ----- | ------------------ |
| sum    | 4-bit | Final BCD sum      |
| cout   | 1-bit | Final carry output |


5. Working Principle

The BCD Adder operates in two stages. In the first stage, a ripple carry adder performs binary addition of the two inputs along with carry-in. The result is stored as an intermediate sum. In the second stage, the circuit checks whether the intermediate result is greater than 9 or if a carry is generated. If either condition is true, the correction value 0110 is added to the intermediate sum using another ripple carry adder.

This ensures that the final output always remains a valid BCD number.

6. Verilog Implementation Overview

The design consists of two ripple carry adder modules. The first adder performs basic binary addition and produces an intermediate result. A combinational logic block evaluates whether correction is required by checking specific bits of the sum and the carry output. If correction is needed, a 4-bit correction value is generated. The second ripple carry adder then adds this correction value to the intermediate sum to produce the final BCD output.

7. Testbench Description

The testbench verifies the BCD Adder by applying different combinations of 4-bit inputs and carry-in values. Each test case is applied sequentially with a small time delay. The outputs are observed to ensure correct binary addition and proper BCD correction when required. The simulation ends after all test cases are executed.

8. Test Cases

| A (4-bit) | B (4-bit) | Cin | Expected Behavior                 |
| --------- | --------- | --- | --------------------------------- |
| 0110      | 1000      | 1   | Valid BCD result after correction |
| 1001      | 0000      | 0   | Direct valid output               |
| 0011      | 1001      | 1   | Correction applied                |
| 0010      | 0001      | 1   | Valid BCD result                  |


9. Expected Output Behavior

The BCD Adder produces correct binary sums for valid BCD inputs and applies correction whenever the result exceeds 9 or generates a carry. The final output is always adjusted to remain within valid BCD representation, ensuring accurate decimal-based arithmetic operation.

10. Simulation Procedure

The design is simulated using a Verilog simulator such as Vivado. The design file and testbench file are added to the project. The testbench is set as the top module, and behavioral simulation is executed. The waveform is observed to verify correct addition, carry generation, and BCD correction behavior.

11. Applications

The BCD Adder is widely used in digital calculators, digital display systems, financial computation systems, and any application requiring decimal arithmetic operations. It is also used in digital counters and arithmetic logic units where BCD representation is required.

12. Advantages and Limitations

The main advantage of the BCD Adder is that it directly supports decimal arithmetic, making it suitable for human-readable numerical systems. However, its limitation is additional hardware complexity due to correction logic, making it slower and more resource-intensive than pure binary adders.

13. Conclusion

The BCD Adder was successfully designed and implemented using Verilog HDL. The simulation results confirm that the circuit correctly performs binary addition and applies proper BCD correction whenever required. The design ensures valid decimal representation for all input combinations.


OUTPUT WAVEFORM


<img width="1081" height="546" alt="Screenshot 2026-06-10 183913" src="https://github.com/user-attachments/assets/bd775a8f-02aa-43dd-b1eb-a260bce0464d" />

