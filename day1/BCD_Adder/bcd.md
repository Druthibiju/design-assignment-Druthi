BCD Adder

The Binary Coded Decimal (BCD) adder is a combinational circuit designed to add two 4-bit BCD numbers and produce a valid BCD result. In normal binary addition, the result may exceed the valid BCD range (0 to 9), so a correction mechanism is required. This design uses ripple carry adders along with correction logic to ensure that the final output remains a valid BCD number.

The design is implemented using two stages of ripple carry adders. The first ripple carry adder takes two 4-bit inputs along with a carry-in and produces an intermediate sum along with a carry output. This intermediate sum represents the direct binary addition of the inputs but may not always be a valid BCD value.

To handle invalid BCD results, a correction detection logic is used. The condition for correction is checked using the higher bits of the intermediate sum and the carry generated from the first addition. If the intermediate result is greater than 9 or if a carry is generated, the correction signal becomes active. This indicates that the result must be adjusted by adding 6 (0110 in binary) to obtain a valid BCD output.
The correction value is generated such that when correction is required, the value 0110 is added to the intermediate sum. When no correction is needed, the correction value remains 0000. This ensures that only invalid BCD results are adjusted while valid results remain unchanged.
The second ripple carry adder performs the final addition between the intermediate sum and the correction value. This stage produces the final corrected BCD sum along with the final carry output. The final output is guaranteed to be within the valid BCD range.
The testbench is used to verify the functionality of the design by applying different sets of input values to the BCD adder. The inputs are changed sequentially at fixed time intervals, and different combinations of binary values along with carry-in are tested. The simulation runs through multiple cases to ensure that both normal addition and correction cases are handled properly. The simulation ends after all test cases are executed.
Overall, the design successfully implements a BCD adder using ripple carry adders and correction logic. It ensures correct BCD output for all valid input combinations and properly handles cases where binary addition exceeds the BCD limit

CIRCUIT DIAGRAM

<img width="2048" height="1088" alt="image" src="https://github.com/user-attachments/assets/117a1ec3-4c26-4cea-8080-3c9e66f33c8e" />


OUTPUT WAVEFORM
<img width="1081" height="546" alt="Screenshot 2026-06-10 183913" src="https://github.com/user-attachments/assets/bd775a8f-02aa-43dd-b1eb-a260bce0464d" />

