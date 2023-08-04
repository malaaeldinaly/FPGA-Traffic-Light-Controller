`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2021 00:51:52
// Design Name: 
// Module Name: Basic_Traffic_Light_Controller
// Project Name: Traffic Light Controller
// Target Devices: Nexys4DDR
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


module Basic_Traffic_Light_Controller(
    input clk,
    input rst,
    output reg [2:0] lights
    );
    
    reg [28:0] timer;
    reg [1:0] state;
    reg [1:0] next_state;
    
    //state encoding
    parameter RED = 2'b00;
    parameter RED_YELLOW = 2'b01;
    parameter GREEN = 2'b10;
    parameter YELLOW = 2'b11;
    
    //state update 
    always @ (posedge clk) begin
        if(rst)
            state <= RED;
        else
            state <= next_state;
    end
    
    //next state logic 
    always @ (*) begin
        case(state)
            RED :   begin
                        if(timer == 0)
                            next_state <= RED_YELLOW;
                        else
                            next_state <= RED;
                    end
            RED_YELLOW : begin
                             if(timer == 0)
                                 next_state <= GREEN;
                             else
                                 next_state <= RED_YELLOW;
                         end
            GREEN : begin
                        if(timer == 0)
                            next_state <= YELLOW;
                        else
                            next_state <= GREEN;
                    end
            YELLOW : begin
                         if(timer == 0)
                             next_state <= RED;
                         else
                             next_state <= YELLOW;
                     end
           default : next_state <= 2'b00;
            
        endcase
    end
    
    //timer to all states 
    always @ (posedge clk) begin
        case(state)
            RED : begin
                    if (timer==0)
                        timer <= 100000000;
                    else
                        timer <= timer-1;
                  end 
            RED_YELLOW : begin
                           if(timer == 0)
                                timer <= 200000000;
                           else
                                timer <= timer-1;
                         end
            GREEN : begin
                      if(timer == 0)
                        timer <= 100000000;
                      else
                        timer <= timer-1;
                    end
            YELLOW : begin
                        if(timer == 0)
                            timer <= 400000000;
                        else
                            timer <= timer-1;
                     end
        endcase
    end
    
    //out logic 
    always @(*) begin
        case(state)
            RED: lights = 3'b100;
            RED_YELLOW: lights = 3'b110;
            GREEN: lights = 3'b001;
            YELLOW: lights = 3'b010;
        endcase
    end

endmodule
