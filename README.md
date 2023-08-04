# FPGA Traffic Light Controller

This repository contains Verilog modules for a traffic light controller, implemented in several variations. Each variation adds more features and complexity to the basic traffic light controller.

## Directory Structure

1. **Basic_Traffic_Light_Controller**: This directory contains the Verilog module for the basic traffic light controller. The controller has four states: Red, Red-Yellow, Green, and Yellow. It uses the input clock source (`clk`) and reset button (`rst`). The timings for each state are pre-defined. The traffic light outputs are denoted by `lights`.

2. **Clock_Divider_Traffic_Light_Controller**: This directory extends the basic traffic light controller by adding a clock divider module. The clock divider generates a 1 Hz clock signal from the original input clock (`clk`). The traffic light controller now uses this 1 Hz signal as the main clock instead of the original `clk`. The states and timings remain the same as in the basic controller.

3. **Serial_Bit_Sequence_Detector**: This directory implements a Finite State Machine (FSM)-based serial bit sequence detector, as presented in the lecture slides. The module takes a switch (`sw`) as an input signal and uses an LED (`errLED`) as the error output. The clock signal frequency is set to 1 Hz.

## Module Details

### Basic_Traffic_Light_Controller

The `Basic_Traffic_Light_Controller` module is a simple traffic light controller with the following states and timings:
- Red state: 100,000,000 clock cycles
- Red-Yellow state: 200,000,000 clock cycles
- Green state: 100,000,000 clock cycles
- Yellow state: 400,000,000 clock cycles

The traffic light outputs are represented by a 3-bit vector `lights`, where:
- `lights[2]` represents Red state
- `lights[1]` represents Red-Yellow state
- `lights[0]` represents Green state

### Clock_Divider_Traffic_Light_Controller

The `Clock_Divider_Traffic_Light_Controller` module extends the basic traffic light controller by adding a clock divider to generate a 1 Hz clock signal (`clk1hz`) from the input clock (`clk`). The traffic light controller uses this 1 Hz clock signal to update its states and timings.

### Serial_Bit_Sequence_Detector

The `Serial_Bit_Sequence_Detector` module implements an FSM-based serial bit sequence detector. It takes a switch signal (`sw`) as input and uses an LED (`errLED`) as the error output. The detector identifies the specific bit sequence as follows:
- The detector starts in the `START` state.
- If the input switch (`sw`) is 0, it moves to `D0_is_0` state, otherwise to `D0_is_1` state.
- Based on the previous state and current input (`sw`), it transitions to `D1_is_0` or `D1_is_1` state.
- In `D1_is_1` state, the `errLED` is set to 1.

## How to Use

Each directory contains a Verilog file for the respective module. To use any of these modules in your project, you can copy the relevant Verilog code into your project files. Make sure to connect the required input and output ports correctly as per your project's top-level module.

Note: For the `Clock_Divider_Traffic_Light_Controller`, you will also need the `clk_divider` module, and for the `Serial_Bit_Sequence_Detector`, you will need the `clk_divider` module as well.

Feel free to explore, modify, and use these modules for your traffic light control or FSM-based designs.

## Revision History

- Revision 0.01: Initial version of each module created.
