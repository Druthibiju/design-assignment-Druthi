APB Slave Design 

The APB slave is designed using a finite state machine (FSM) with three states: IDLE, SETUP, and ACCESS. In the IDLE state, the slave waits for the master to assert PSEL. Once selected, it moves to the SETUP state and then enters the ACCESS state where the actual read or write operation takes place. The slave contains an internal memory of 256 locations, each 32 bits wide. During a write operation, data from PWDATA is stored at the address specified by PADDR. During a read operation, data from the selected memory location is returned on PRDATA. The slave asserts PREADY to indicate completion of the transfer and can generate PSLVERR for invalid accesses.

APB Verification Environment

The verification environment is developed using SystemVerilog object-oriented concepts and consists of a Generator, Driver, Monitor, Scoreboard, and Environment. The generator creates write transactions followed by read transactions to the same address and sends them to the driver through a mailbox. The driver converts these transactions into APB bus activity and drives the DUT. The monitor observes completed APB transfers and captures transaction details. The scoreboard maintains a reference memory model and compares read data from the DUT against expected values to determine pass or fail results. All components are instantiated and connected within the environment, while the test class controls the execution and reports the final verification statistics. This setup verifies the correctness of APB read and write operations performed by the slave.

Output waveform
<img width="1600" height="350" alt="WhatsApp Image 2026-06-17 at 8 03 38 PM" src="https://github.com/user-attachments/assets/cd502f8e-54d7-4af1-85f9-a6fc0b39083f" />

