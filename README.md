# VHDL-Collection

## About

This repository contains a collection of VHDL projects and digital logic designs that I have built to practice and improve my hardware description skills. Rather than just storing the code, each project folder contains its own documentation explaining the system architecture, state machines, and simulation details.
The objective of this repository is to build a structured portfolio of digital design projects while continuously improving my understanding of FPGA programming and logic circuits.

---

## Repository Structure

```text
VHDL-Collection/
├── Automatic-Parking/
├── Coca-Cola-Vending-Machine/
├── README.md
└── .gitignore
```

Each project directory generally contains:

* **README.md** — Complete documentation, requirements, block diagrams, and usage instructions.
* **.vhd files** — The core VHDL design and testbench files.

---

## Projects

| Project | Difficulty | Type | Summary |
| :--- | :---: | :---: | :--- |
| [Automatic Parking](./Automatic-Parking/) | 🟡 Intermediate | Control Logic | A digital control system for an automated parking lot, managing entry/exit states and tracking available spaces. |
| [Coca-Cola Vending Machine](./Coca-Cola-Vending-Machine/) | 🟡 Intermediate | Datapath & FSM | A vending machine controller utilizing a separated Datapath and Control Unit, handling coin accumulation, change calculation, and product release. |

---

## Concepts Covered

* Digital Logic Design
* Finite State Machines (FSM)
* Datapath and Control Unit Architecture
* Structural and Behavioral Modeling in VHDL
* Parametric Design (using VHDL Generics)
* Component Instantiation & Port Mapping
* Digital Arithmetic & Register Management
* Sensor Logic & Event Filtering

---

## Tools & Libraries

* VHDL 
* Xilinx Vivado (Design, Synthesis, and Simulation)
* Git & GitHub
