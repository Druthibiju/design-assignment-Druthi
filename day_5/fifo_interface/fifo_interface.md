FIFO 

This SystemVerilog testbench is developed to verify the functionality of the FIFO module fifo. It generates the required clock and reset signals, applies write and read operations, and observes the FIFO outputs and status flags during simulation.
The fifo_if interface is used to group all FIFO signals such as clock, reset, write enable, read enable, input data, output data, full, and empty. Using an interface simplifies the connection between the testbench and the DUT (Design Under Test).
Inside the testbench, an instance of the FIFO module is created and connected through the interface signals. Local testbench signals are assigned to the interface, allowing the testbench to drive inputs and monitor outputs easily.
A clock signal is generated using a forever loop that toggles every 5 ns, producing a clock period of 10 ns. This clock drives all synchronous operations in the FIFO.
At the beginning of the simulation, the reset signal is asserted to initialize the FIFO. During this period, write enable, read enable, and input data are kept inactive. After 20 ns, the reset is deasserted, allowing normal FIFO operation.
The write operation begins by enabling wr_enb_tb and applying four data values: 11h, 22h, 33h, and 44h. Each value is applied for one clock cycle, allowing the FIFO to store the data sequentially.
After completing the write operations, the write enable signal is disabled. Following a short delay, the read enable signal is asserted to retrieve the stored data from the FIFO.
During the read phase, the FIFO should output the data in the same order in which it was written, demonstrating the First-In First-Out principle. Therefore, the expected output sequence is 11h, 22h, 33h, and 44h.
A $monitor statement continuously displays simulation time, reset status, write and read enables, input data, output data, and the FIFO status signals (full and empty). This helps in verifying the correct operation of the FIFO throughout the simulation.
Finally, the simulation ends using the $finish system task after all write and read operations are completed. The testbench thus validates the basic storage and retrieval functionality of the FIFO design.

Output waveform

<img width="1573" height="816" alt="image" src="https://github.com/user-attachments/assets/63e75230-5ae8-4950-8b35-60cf0f899d35" />

