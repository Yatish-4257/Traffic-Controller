module Traffic_Light_Controller(
    input clk,              // Clock signal
    input rst,              // Reset signal
    output reg [2:0] light_M1, // Traffic light for main road 1
    output reg [2:0] light_S,  // Traffic light for side road
    output reg [2:0] light_MT, // Traffic light for main road turn
    output reg [2:0] light_M2  // Traffic light for main road 2
);

    // State definitions
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
    reg [3:0] count;        // Counter for timing
    reg [2:0] ps;           // Current state
    // Timing parameters (in clock cycles)
    parameter sec7 = 7, sec5 = 5, sec2 = 2, sec3 = 3;

    // State transition logic
    always @(posedge clk or posedge rst)
    begin
        if (rst == 1)
        begin
            ps <= S0;      // Reset state to S0
            count <= 0;    // Reset counter
        end
        else
        begin
            case (ps)
                S0: if (count < sec7)
                    begin
                        ps <= S0; // Stay in S0
                        count <= count + 1; // Increment counter
                    end
                    else
                    begin
                        ps <= S1; // Move to S1
                        count <= 1; // Reset counter
                    end

                S1: if (count < sec2)
                    begin
                        ps <= S1; // Stay in S1
                        count <= count + 1; // Increment counter
                    end
                    else
                    begin
                        ps <= S2; // Move to S2
                        count <= 1; // Reset counter
                    end

                S2: if (count < sec5)
                    begin
                        ps <= S2; // Stay in S2
                        count <= count + 1; // Increment counter
                    end
                    else
                    begin
                        ps <= S3; // Move to S3
                        count <= 1; // Reset counter
                    end

                S3: if (count < sec2)
                    begin
                        ps <= S3; // Stay in S3
                        count <= count + 1; // Increment counter
                    end
                    else
                    begin
                        ps <= S4; // Move to S4
                        count <= 1; // Reset counter
                    end

                S4: if (count < sec3)
                    begin
                        ps <= S4; // Stay in S4
                        count <= count + 1; // Increment counter
                    end
                    else
                    begin
                        ps <= S5; // Move to S5
                        count <= 1; // Reset counter
                    end

                S5: if (count < sec2)
                    begin
                        ps <= S5; // Stay in S5
                        count <= count + 1; // Increment counter
                    end
                    else
                    begin
                        ps <= S0; // Move to S0
                        count <= 1; // Reset counter
                    end

                default: ps <= S0; // Default state
            endcase
        end
    end

    // Output logic based on current state
    always @(ps)
    begin
        case (ps)
            S0:
            begin
                light_M1 <= 3'b001; // Main road 1: Green
                light_M2 <= 3'b001; // Main road 2: Green
                light_MT <= 3'b100; // Main road turn: Red
                light_S  <= 3'b100; // Side road: Red
            end

            S1:
            begin
                light_M1 <= 3'b001; // Main road 1: Green
                light_M2 <= 3'b010; // Main road 2: Yellow
                light_MT <= 3'b100; // Main road turn: Red
                light_S  <= 3'b100; // Side road: Red
            end

            S2:
            begin
                light_M1 <= 3'b001; // Main road 1: Green
                light_M2 <= 3'b100; // Main road 2: Red
                light_MT <= 3'b001; // Main road turn: Green
                light_S  <= 3'b100; // Side road: Red
            end

            S3:
            begin
                light_M1 <= 3'b010; // Main road 1: Yellow
                light_M2 <= 3'b100; // Main road 2: Red
                light_MT <= 3'b010; // Main road turn: Yellow
                light_S  <= 3'b100; // Side road: Red
            end

            S4:
            begin
                light_M1 <= 3'b100; // Main road 1: Red
                light_M2 <= 3'b100; // Main road 2: Red
                light_MT <= 3'b100; // Main road turn: Red
                light_S  <= 3'b001; // Side road: Green
            end

            S5:
            begin
                light_M1 <= 3'b100; // Main road 1: Red
                light_M2 <= 3'b100; // Main road 2: Red
                light_MT <= 3'b100; // Main road turn: Red
                light_S  <= 3'b010; // Side road: Yellow
            end

            default:
            begin
                light_M1 <= 3'b000; // All lights off
                light_M2 <= 3'b000; // All lights off
                light_MT <= 3'b000; // All lights off
                light_S  <= 3'b000; // All lights off
            end
        endcase
    end
endmodule
