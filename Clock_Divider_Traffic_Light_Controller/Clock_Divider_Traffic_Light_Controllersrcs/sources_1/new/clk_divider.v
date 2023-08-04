`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2021 01:25:19
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    input rst,
    output dcm,
    output reg clk1hz
);
    wire clk5mhz;
    
    clk_wiz_0 clk_ip( .clk_in1(clk), .clk_out1(clk5mhz), .reset(rst), .locked(dcm));
    
    reg [29:0] counter;
    always @ (posedge clk5mhz) begin
        if (rst) begin
            counter <= 0;
            clk1hz <= 0;
        end
        else begin
            counter <= counter + 1;
            if (counter == 2499999) begin
                clk1hz <= ~clk1hz;
                counter <= 0;
            end
        end
    end
endmodule
