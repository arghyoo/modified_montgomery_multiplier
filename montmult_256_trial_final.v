`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 12:36:06 AM
// Design Name: 
// Module Name: montmult_256
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
module montmult_256_trial_final(

input [255:0] A,
input [255:0] B,
input [254:0] M,
//input [7:0] N,
input [257:0] M_dash,
input clk,
output reg [255:0] R
 );
 

 reg [255:0] A_temp, B_temp;
 reg [254:0] M_temp;
 
 reg [257:0] M_dash_temp;
 
 always @(posedge clk)
 begin
     A_temp<=A;
     B_temp<=B;
     M_temp<=M;
	  M_dash_temp<=M_dash;
   //  r<=2<<(N+1);     
     R<=Rw;
 end
 
 //wire [258:0] r;
 
 
// assign r = {1'b1, 258'd0};
 
//wire [515:0] T_temp; 
wire [511:0] T;
 
//toomcook15ab256bit m1(.clk(clk),.D_in(A_temp),.E_in(B_temp),.F_out(T));
//sbm_256bits m1( .D(A_temp),.E(B_temp), .clk(clk), .F(T));
//kara2m2_smm256 m1( .a(A_temp),.b(B_temp), .clk(clk), .out(T));
kara2m2_smm256_method_1 m1( .a(A_temp),.b(B_temp), .clk(clk), .out(T));
//karas3_smm_258_method_2 m1( .A({2'b0,A_temp}),.B({2'b0,B_temp}), .clk(clk), .P(T_temp));
//kara4m2_256 m1 ( .A(A_temp),.B(B_temp), .P(T), .clk(clk));
//karas3_smm_256_method_5 m1 ( .A(A_temp),.B(B_temp), .clk(clk), .P(T));
 
//assign T = T_temp[511:0];
 
wire [257:0] r_temp;
//assign r_temp= r+258'd463168356949264781694283940034751631413079938662562256157830336031652518559743;
//assign r_temp= r-1'b1; 
assign r_temp= 258'd463168356949264781694283940034751631413079938662562256157830336031652518559743;

//wire [511:0] Tl;
 wire [257:0] Tone;
 
//assign Tl= T & {254'd0, r_temp};
assign Tone= T[257:0] & r_temp;

//wire [515:0] Qi;
wire [257:0] Qi;
 
//sbm_258_modified m2( .D(M_dash_temp),.E(Tone[257:0]), .clk(clk), .F(Qi));
//karas3_smm_258_method_3 m2( .A(M_dash_temp),.B(Tone[257:0]), .clk(clk), .P(Qi));
kara2m2_smm258_method_1 m2( .a(M_dash_temp),.b(Tone[257:0]), .out(Qi), .clk(clk));

 
//wire [515:0] Q;
wire [257:0] Q;
 
//assign Q = Qi & {258'd0, r_temp};
assign Q = Qi[257:0] & r_temp;

wire [515:0] Hi;
//wire [512:0] Hi;
//sbm_258_255 m3( .D(Q[257:0]),.E(M_temp),.clk(clk),.F(Hi));
//karas3_smm_258_method_2 m3( .A(Q[257:0]),.B({3'd0, M_temp}),.clk(clk),.P(Hi));
kara2m2_smm258_255_method_1 m3 ( .a(Q[257:0]),.b({3'd0, M_temp}),.clk(clk),.out(Hi));

/////////////////////////////////////////////////////////////////////////////////////
//wire [516:0] H;
wire [513:0] H; 
 
assign H= T + Hi[512:0];
 
//wire [516:0] Rw_temp;
wire [255:0] Rw;


 
//assign Rw_temp= H>>258;
//assign Rw= Rw_temp[255:0];
//assign Rw=H[516:261];


assign Rw=H[513:258];
//////////////////////////////////////////////////////////////////////////////////

 
 endmodule
