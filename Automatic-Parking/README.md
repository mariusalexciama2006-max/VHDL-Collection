\# Automatic Parking System (VHDL)



\## About The Project



This project is a VHDL implementation of an intelligent digital control system for an automated parking lot. The parking lot has a rectangular layout and features two independent entry/exit gates. 



The system relies on a robust combination of a \*\*Control Unit\*\* and a \*\*Datapath\*\* to monitor the availability of parking spaces in real-time. It features advanced sensor logic to determine the direction of the vehicle (entering or exiting) and intelligent filtering to ignore small objects like pedestrians or animals, ensuring accurate tracking of available spaces.



\### Specifications

\* \*\*Capacity:\*\* Parametric design (default: 50 parking spaces).

\* \*\*Gate Layout:\*\* 2 independent, bidirectional gates.

\* \*\*Sensor Logic:\*\*

&#x20; \* \*\*Direction Detection:\*\* Deduced by the activation sequence of the two optical sensors per gate.

&#x20; \* \*\*Object Filtering:\*\* A vehicle is only counted if both sensors at a gate are triggered simultaneously at some point during the passage.

&#x20; \* \*\*Simultaneous Events:\*\* The system handles concurrent events (e.g., two cars entering at exactly the same time, or one entering while another exits) without losing count.



\---



\## Entity I/O Description



The top-level entity (`Parking\_Structural`) interfaces with the external world through the following ports:



\### Inputs

| Port | Type | Description |

| :--- | :--- | :--- |

| `clk` | `std\_logic` | System clock |

| `rst` | `std\_logic` | Asynchronous reset (initializes the lot to maximum free spaces) |

| `sen\_1a` | `std\_logic` | First optical sensor of Gate 1 |

| `sen\_2a` | `std\_logic` | Second optical sensor of Gate 1 |

| `sen\_1b` | `std\_logic` | First optical sensor of Gate 2 |

| `sen\_2b` | `std\_logic` | Second optical sensor of Gate 2 |



\### Outputs

| Port | Type | Description |

| :--- | :--- | :--- |

| `locuri\_libere` | `integer` | The current number of free (available) parking spaces |



\---



\## System Architecture



The design is strictly separated into a Behavioral Control Unit and a Structural Datapath.



\### 1. Control Unit (`Control\_Unit.vhd`)

The Control Unit analyzes the sensor signals and issues commands to the datapath:

\* \*\*Direction Tracking (`sens\_p1`, `sens\_p2`):\*\* Registers whether sensor 1 or sensor 2 was activated first to determine if a car is entering or leaving.

\* \*\*Validation (`conf\_p1`, `conf\_p2`):\*\* Sets a confirmation flag only when both sensors are active simultaneously, successfully filtering out objects too small to span the distance between the sensors.

\* \*\*Command Generation (`cmd\_en`, `cmd\_sel`):\*\* Once the sensors are cleared (car has passed), the unit calculates the required arithmetic operation. It intelligently maps single events (+1, -1) and simultaneous multi-gate events (+2, -2) to the correct multiplexer selection, while completely canceling out events that result in zero net change (e.g., +1 at Gate 1 and -1 at Gate 2 simultaneously).



\### 2. Datapath (`Parking\_Structural.vhd`)

The Datapath executes the mathematical operations required to keep track of the parking spaces:

\* \*\*Adders/Subtractors:\*\* Four distinct arithmetic units calculate the possible future states of the parking lot:

&#x20; \* `Sumator\_1` / `Scazator\_1`: Adjusts the free space count by \*\*1\*\* (single car leaving/entering).

&#x20; \* `Sumator\_2` / `Scazator\_2`: Adjusts the free space count by \*\*2\*\* (two cars leaving/entering simultaneously).

\* \*\*Multiplexer (`Mux4\_1`):\*\* Routes one of the four calculated values to the main register based on the `cmd\_sel` signal from the Control Unit.

\* \*\*Register (`Registru`):\*\* Holds the current number of available spaces (`locuri\_curente`), updating on the clock edge only when enabled (`cmd\_en`) by the Control Unit.



\---



\## How to Simulate



1\. Open your VHDL simulator (e.g., Xilinx Vivado).

2\. Load the top-level structural file (`Parking\_Structural.vhd`), the control unit (`Control\_Unit.vhd`), and all required sub-components (Adders, Subtractors, MUX, and Register).

3\. Compile the design.

4\. Run a simulation using a Testbench to simulate the specific timing of the sensors (ensuring you overlap the `sen\_1` and `sen\_2` signals to validate a car passage). 

5\. Assert the `rst` signal at the beginning of the simulation to initialize the parking lot to `locuri\_maxime` (50).

