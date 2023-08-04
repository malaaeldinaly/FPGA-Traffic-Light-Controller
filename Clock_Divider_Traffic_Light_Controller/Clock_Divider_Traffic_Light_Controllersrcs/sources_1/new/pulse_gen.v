`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2021 01:32:35
// Design Name: 
// Module Name: pulse_gen
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


module pulse_gen(
    input clk_in,
    input rst,
    output reg clk_out
    );
    reg [29:0] counter;
    always @ (posedge clk_in) begin
        if(rst)begin
            counter <= 0;
            clk_out <=0;
        end
        else
            counter <= counter +1;
            
        if (counter == 4999999)begin
            clk_out <= ~clk_out;
            counter <=0;
        end
        else
            clk_out <=clk_out;
    end
endmodule
