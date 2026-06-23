
fifo Transaction Class 

The `transaction` class is used to represent a single FIFO transaction within the verification environment. It serves as a container for all the information associated with a FIFO operation, including control signals, input data, output data, and status flags. By encapsulating these signals into a single object, the transaction class simplifies communication between the generator, driver, monitor, and scoreboard.

The class contains three randomized variables: `wren`, `rden`, and `datain`. The `wren` signal controls write operations to the FIFO, while the `rden` signal controls read operations. The `datain` field stores the 8-bit data value that will be written into the FIFO. Since these variables are declared as `rand`, they can be randomized by the generator to create different test scenarios.

The class also includes non-random variables `full`, `empty`, and `dataout`. These fields are used to capture the FIFO's response after a transaction has been executed. The `full` signal indicates whether the FIFO is full, the `empty` signal indicates whether the FIFO is empty, and `dataout` stores the data read from the FIFO during a read operation. These values are typically collected by the monitor and passed to the scoreboard for verification.

A constraint named `c1` is defined on the `wren` signal using a weighted distribution. The constraint `wren dist {0:=2, 1:=8};` increases the probability of generating write operations. Specifically, there is an 80% chance that `wren` will be assigned a value of `1` and a 20% chance that it will be assigned a value of `0`. This bias helps generate more write transactions, which is useful when testing FIFO storage functionality.

The class also contains a `display()` function that prints the contents of the transaction object. This method is primarily used for debugging and simulation analysis. It displays the values of all transaction fields, including write enable, read enable, input data, output data, and FIFO status signals. The string argument `s` allows the user to identify the source of the display message, such as the generator, driver, monitor, or scoreboard.

Overall, the `transaction` class acts as the fundamental data structure of the FIFO verification environment. It enables efficient transaction-level communication between testbench components, supports constrained-random stimulus generation, and provides a convenient mechanism for observing and debugging FIFO operations during simulation.
