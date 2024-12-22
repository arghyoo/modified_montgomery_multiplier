`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2024 15:09:30
// Design Name: 
// Module Name: sbm86bit_unsigned
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

module sbm8bit_unsigned (
    input wire [7:0] D,
    input wire [7:0] E,
    input wire clk,
    output reg [15:0] F
);

    reg [7:0] a_q;
    reg [7:0] b_q;
    wire [15:0] c_q;

    always @(posedge clk) begin
        a_q <= D;
        b_q <= E;
        F <= c_q;
    end

    // Actual Logic
    wire [15:0] pp_0, pp_1, pp_2, pp_3, pp_4, pp_5, pp_6, pp_7;
	assign pp_0  = {{8{1'b0}}, {a_q & {8{b_q[0]}}}};
    assign pp_1  = {{7{1'b0}}, {a_q & {8{b_q[1]}}}, {1{1'b0}}};
    assign pp_2  = {{6{1'b0}}, {a_q & {8{b_q[2]}}}, {2{1'b0}}};
    assign pp_3  = {{5{1'b0}}, {a_q & {8{b_q[3]}}}, {3{1'b0}}};
    assign pp_4  = {{4{1'b0}}, {a_q & {8{b_q[4]}}}, {4{1'b0}}};
    assign pp_5  = {{3{1'b0}}, {a_q & {8{b_q[5]}}}, {5{1'b0}}};
    assign pp_6  = {{2{1'b0}}, {a_q & {8{b_q[6]}}}, {6{1'b0}}};
    assign pp_7  = {{1{1'b0}}, {a_q & {8{b_q[7]}}}, {7{1'b0}}};
    
   
    
    wire [15:0] ppa_0, ppa_1, ppa_2, ppa_3;
    
    assign ppa_0 = pp_0 + pp_1;
    assign ppa_1 = pp_2 + pp_3;
    assign ppa_2 = pp_4 + pp_5;
    assign ppa_3 = pp_6 + pp_7;
    
    
    
    wire [15:0] ppb_0, ppb_1;

    assign ppb_0 = ppa_0 + ppa_1;
    assign ppb_1 = ppa_2 + ppa_3;
    
    
    
  
    
    assign c_q = ppb_0 + ppb_1;


    
endmodule


