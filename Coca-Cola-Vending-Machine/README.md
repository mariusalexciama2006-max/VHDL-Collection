# Coca-Cola Vending Machine (VHDL)

## About The Project

This project is a VHDL implementation of a digital controller for a Coca-Cola vending machine. The system is designed using a clear separation between the **Data Path** (structural architecture) and the **Control Unit** (Finite State Machine). 

The vending machine accepts specific Romanian coins (bani), accumulates the sum, dispenses the product when the price is reached, and calculates the necessary change. It also features safety mechanisms, such as rejecting foreign objects and blocking coin insertion if the machine is out of stock.

### Specifications
* **Product Price:** 1 Leu (100 bani)
* **Accepted Coins:** 5, 10, and 50 bani
* **Safety Features:** 
  * Rejects coins/objects if a foreign body is detected.
  * Blocks coin acceptance if the machine is empty (Out of Stock).
  * Allows the user to cancel the transaction and return the inserted money.

---

## Entity I/O Description

The top-level entity interfaces with the external world through the following ports:

### Inputs
| Port | Type | Description |
| :--- | :--- | :--- |
| `clk` | `std_logic` | System clock |
| `rst` | `std_logic` | Asynchronous reset |
| `F0` | `std_logic` | Photocell for 5 bani coin |
| `F1` | `std_logic` | Photocell for 10 bani coin |
| `F2` | `std_logic` | Photocell for 50 bani coin |
| `F3` | `std_logic` | Sensor for rejected coin (unaccepted/foreign object) |
| `F4` | `std_logic` | Signal for coin acceptance |
| `FS` | `std_logic` | Out of stock signal (0 = In stock, 1 = Empty) |
| `RM` | `std_logic` | Return money request (cancel transaction) |

### Outputs
| Port | Type | Description |
| :--- | :--- | :--- |
| `AM` | `std_logic` | Signal to mechanically accept the inserted coin |
| `AT` | `std_logic` | Signal indicating the total price (1 Leu) has been reached |
| `eliberare_s` | `std_logic` | Signal to release the Coca-Cola product |
| `valoare_rest` | `unsigned(7 downto 0)` | 8-bit bus indicating the value of the change/returned money |

---

## System Architecture

The design is split into two main modules connected structurally in `Top.vhd`:

### 1. Control Unit (FSM)
The Control Unit is a Finite State Machine implemented in `UC.vhd` that dictates the flow of the machine. It cycles through the following states:
* `idle`: Waits for user input (coin insertion or cancel request). Blocks input if `FS=1` or `F3=1`.
* `adauga_moneda`: Asserts the `AM` signal and tells the register to load the new sum.
* `verifica_suma`: Checks if the accumulated sum is $\ge$ 100 bani.
* `distribuie_monedele`: Asserts `AT` and `eliberare_s` to dispense the product and routes the calculated change to the output.
* `returneaza_moneda`: Routes the currently accumulated sum to the output if the user cancels (`RM=1`).
* `elibereaza_registrul`: Clears the internal accumulator before returning to `idle`.

### 2. Datapath (Structural)
The datapath performs all arithmetic and logical operations based on signals from the Control Unit:
* **Decoder:** Converts photocell inputs (`F0`, `F1`, `F2`) to numeric values (5, 10, 50).
* **Adder & Register:** Accumulates the total inserted amount.
* **Comparator (`comp_100`):** Checks if the sum has reached 100 bani.
* **Subtractor:** Calculates the change (`sum - 100`).
* **Multiplexer (`mux_2_1`):** Selects between outputting the change (after a successful purchase) or the total accumulated sum (if the transaction is canceled).

---

## How to Simulate

1. Open your VHDL simulator (e.g., Xilinx Vivado, ModelSim, or GHDL).
2. Load the top-level structural file (`Top.vhd`), the control unit (`UC.vhd`), and all sub-component files (`decoder.vhd`, `sum.vhd`, etc.).
3. Compile the design.
4. Load the accompanying testbench (if provided) or manually force the clock, reset, and sensor signals to verify the state transitions and outputs.
