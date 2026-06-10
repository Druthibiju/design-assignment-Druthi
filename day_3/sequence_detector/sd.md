1110 Sequence Detector

The 1110 sequence detector is a sequential digital circuit designed to detect the binary sequence “1110” in a serial input stream. The system operates using a clock signal and reset input, and it produces an output signal when the target sequence is successfully detected. The design is typically implemented using a finite state machine (FSM) to track the occurrence of input bits in order.
The detector works by continuously monitoring the serial input bit stream at every positive edge of the clock. The system transitions through different states depending on the sequence of input bits received. When the correct pattern “1110” is detected, the output is asserted high for one clock cycle. Overlapping sequences are also considered, meaning the system can detect new patterns without resetting completely.
The system is implemented using a Mealy or Moore finite state machine. Each state represents how much of the target sequence has been matched so far. As input bits arrive, the FSM transitions between states until the full sequence is detected.
STATE DIAGRAM
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/1fe967e5-a327-486c-83a7-ae94d8cbaf9a" />

<img width="1087" height="541" alt="image" src="https://github.com/user-attachments/assets/05af04e1-3078-4fcf-8df1-7acb4700e795" />

