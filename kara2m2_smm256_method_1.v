`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 13:33:12
// Design Name: 
// Module Name: kara2m2_512
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


module kara2m2_smm256_method_1( input  [255:0] a,
    input  [255:0] b,
    output reg  [511:0] out,
    input clk
    
    );
    

  wire  [127:0] a0,a1,b0,b1;
    wire [255:0] p0,p2;
    wire [257:0] p11;
    
    reg [255:0] A_temp, B_temp;
    wire [511:0] P_temp;
    
    always @(posedge clk)
    begin
        A_temp<=a;
        B_temp<=b;
        out<=P_temp;   
    end
    
      
  assign  a0 = A_temp[127:0];
  assign   a1 = A_temp[255:128];
   
    
   assign  b0 = B_temp[127:0]; 
   assign  b1 = B_temp[255:128];
   
        

  // assign     p0 = a0*b0;
//	assign     p2 =  a1*b1;
 //  assign     p1 = ((a0+a1)*(b0+b1))-p0-p2;
 wire [128:0] p1_temp;
 wire [128:0] p2_temp;
 
assign p1_temp= a0+a1;
assign p2_temp=b0+b1;
   
//sbm128bit_unsigned m1 (.D(a0), .E(b0), .clk(clk), .F(p0)); 
kara2m2_smm128 m1 (.a(a0), .b(b0), .out(p0), .clk(clk));
 
//sbm128bit_unsigned m2 (.D(a1), .E(b1), .clk(clk), .F(p2)); 
kara2m2_smm128 m2 (.a(a1), .b(b1), .out(p2), .clk(clk));

//sbm129bit_unsigned m3 (.D(p1_temp), .E(p2_temp), .clk(clk), .F(p1));  
kara2m2_smm129 m3 (.a(p1_temp), .b(p2_temp), .out(p11), .clk(clk)); 
 
wire [258:0] p1;
 assign p1= p11-p0-p2;  

 assign  P_temp = p0 + (p1<<128) + (p2<<256) ;
	 // assign P_temp=p0+ {p1, {128{1'b0}}} + {p2, {256{1'b0}}}; 
         

endmodule

