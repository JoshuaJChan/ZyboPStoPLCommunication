`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2024 03:18:02 AM
// Design Name: 
// Module Name: Blinker
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


module Blinker(
    input clk,
    input [7:0] num,
    input received,
    output finish,
    output led
    );
    
    reg [7:0] count;
    reg [3:0] state;
    reg finish, led;
    
    parameter idle=0, blink=1;
    
    always @ (posedge(clk)) begin
        state <= idle;
        finish <= 1;
        
        case(state)
            idle: begin
                if (received) begin
                    state <= blink;
                    finish <= 0;
                end
                led <= 1;
            end
            
            blink: begin
                if(count == num) begin
                    finish <= 1;
                    count <= 0;
                    state <= idle;
                end else begin
                    count <= count + 1;
                    #400000000;//ns = 0.4s
                    led <= 1;
                    #100000000;
                    led <= 0;
                end
            end
        endcase
    end
endmodule
