`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2021 01:46:40
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
    output clk_out
    );
    reg [29:0] counter;
    always @ (posedge clk_in) begin
        if (rst)
            counter <= 0;
        else if (counter == 4999999)
            counter <= 0;
        else 
            counter <= counter + 1;
    end
    assign clk_out = (counter == 4999999);
endmodule
