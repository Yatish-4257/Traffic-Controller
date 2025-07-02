# traffic_light_control
The given code defines a traffic light controller module in Verilog, which manages the states of traffic lights at an intersection. The module has the following features:

1. *Inputs and Outputs*:
   - clk: Clock signal.
   - rst: Reset signal.
   - light_M1, light_S, light_MT, light_M2: Outputs representing the traffic light states for main road 1, side road, main road turn, and main road 2, respectively. Each output is a 3-bit signal representing the colors (e.g., Red, Yellow, Green).

2. *State Machine*:
   - The controller operates as a finite state machine (FSM) with six states (S0 to S5).
   - Parameters sec7, sec5, sec2, sec3 define the duration of each state in clock cycles.

3. *Behavior*:
   - On the rising edge of the clock or reset, the FSM transitions between states based on a counter that increments with each clock cycle.
   - The state transitions occur as follows:
     - S0: Main road 1 and 2 are green, others are red.
     - S1: Main road 1 is green, main road 2 is yellow, others are red.
     - S2: Main road 1 is green, main road turn is green, main road 2 and other are red .
     - S3: Main road 1 and turn are yellow, others are red.
     - S4: Side road is green, others are red.
     - S5: Side road is yellow, others are red.
   - Each state lasts for a predefined number of clock cycles before transitioning to the next state.

4. *Output Logic*:
   - The outputs are updated based on the current state (ps). Each state assigns specific colors to the traffic lights:
     - 3'b001 represents green.
     - 3'b010 represents yellow.
     - 3'b100 represents red.

This module effectively simulates the traffic light sequence at an intersection, ensuring smooth and organized traffic flow by controlling the light signals based on the predefined timing and state transitions.
