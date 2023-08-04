`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2021 01:45:25
// Design Name: 
// Module Name: Serial_Bit_Sequence_Detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Serial_Bit_Sequence_Detector(
    input clk,
    input rst,
    input sw,
    output errLED
    );
    
    wire clk1hz;
    wire dcm;
    reg [2:0] state;
    reg [2:0] next_state;
    
    clk_divider(.clk(clk), .rst(rst), .clk1hz(clk1hz), .dcm(dcm));
    
    //state encoding 
    parameter START = 3'b000;
    parameter D0_is_0 = 3'b001;
    parameter D0_is_1 = 3'b010;
    parameter D1_is_0 = 3'b011;
    parameter D1_is_1 = 3'b100;
    //next state 
    always @ (posedge clk1hz) begin
        if(rst)
            state <= START;
        else
            state <= next_state;
    end
    
    //next state logic 
    always @ (*) begin// if shows error, change it to posedge clk 
        case(state)
        START : begin
                    if(sw == 0)
                        next_state <= D0_is_0;
                    else
                        next_state <= D0_is_1;
                end
        D0_is_0 : begin
                    if(sw == 0)
                        next_state <= D1_is_0;
                    else
                        next_state <= D1_is_0;
                end
        D0_is_1 : begin
                    if(sw == 0)
                        next_state <= D1_is_0;
                    else
                        next_state <= D1_is_1;
                end
        D1_is_0 : begin
                    if(sw == 0)
                        next_state <= START;
                    else
                        next_state <= START;
                end
        D1_is_1 : begin
                    if(sw == 0)
                        next_state <= START;
                    else
                        next_state <= START;
                end
        endcase
    end
    
    
    //output logic 
    assign errLED = (state == D1_is_1);
    
    
endmodule
