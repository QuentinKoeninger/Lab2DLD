`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
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

/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module top_demo
(
  // input
  input  logic [7:0] sw,
  input  logic [3:0] btn,
  input  logic       sysclk_125mhz,
  input  logic       rst,
  // output  
  output logic [7:0] led,
  output logic sseg_ca,
  output logic sseg_cb,
  output logic sseg_cc,
  output logic sseg_cd,
  output logic sseg_ce,
  output logic sseg_cf,
  output logic sseg_cg,
  output logic sseg_dp,
  output logic [3:0] sseg_an
);

  logic [16:0] CURRENT_COUNT;
  logic [16:0] NEXT_COUNT;
  logic        smol_clk;
  
  logic [63:0] key;
  assign key = 64'hf431_a7fe_a1c8_7907;
  
  logic [63:0] plaintext;
  assign plaintext = 64'hf12ed07e0a366b9f;
  
  logic [63:0] ciphertext;
  
  logic encrypt; 
  assign encrypt = 1'b1;
  
  logic [63:0] deciphertext;
  
  logic [3:0] dig0, dig1, dig2, dig3;

  
  DES eDES (key, plaintext, encrypt, ciphertext);
  DES dDES (key, ciphertext, ~encrypt, deciphertext);
  
  // 7-segment display
  segment_driver driver(
  .clk(smol_clk),
  .rst(sw[7]),
  .digit0(dig0),
  .digit1(dig1),
  .digit2(dig2),
  .digit3(dig3),
  .decimals({1'b0, sw[6:4]}),
  .segment_cathodes({sseg_dp, sseg_cg, sseg_cf, sseg_ce, sseg_cd, sseg_cc, sseg_cb, sseg_ca}),
  .digit_anodes(sseg_an)
  );

// Register logic storing clock counts
always@(posedge sysclk_125mhz)
  begin
    if(sw[7])
      CURRENT_COUNT = 17'h00000;
    else
      CURRENT_COUNT = NEXT_COUNT;
      
    case (plaintext)
        deciphertext: led[0] = 'b1;
        default: led[0] = 'b0;
    endcase
    
    if (^key[63:57] == key[56] && ^key[55:49] == key[48] && ^key[47:41] == key[40] && ^key[39:33] == key[32] && ^key[31:25] == key[24] && ^key[23:17] == key[24] && ^key[15:1]==key[0])led[1] = 1'b1;
    else led[1] = 1'b0;
  
    if (sw[0]) begin
        case (btn)
            'b0001: begin
                dig0 = plaintext[3:0];
                dig1 = plaintext[7:4];
                dig2 = plaintext[11:8];
                dig3 = plaintext[15:12];      
            end
            'b0010: begin
                dig0 = plaintext[19:16];
                dig1 = plaintext[23:20];
                dig2 = plaintext[27:24];
                dig3 = plaintext[31:28];      
            end
            'b0100: begin
                dig0 = plaintext[35:32];
                dig1 = plaintext[39:36];
                dig2 = plaintext[43:40];
                dig3 = plaintext[47:44];      
            end
            'b1000: begin
                dig0 = plaintext[51:48];
                dig1 = plaintext[55:52];
                dig2 = plaintext[59:56];
                dig3 = plaintext[63:60];      
            end
            default: begin             
                dig0 = 'h0;
                dig1 = 'h0;
                dig2 = 'h0;
                dig3 = 'h0;      
            end
        endcase
    end else if (sw[1]) begin
        case (btn)
            'b0001: begin
                dig0 = ciphertext[3:0];
                dig1 = ciphertext[7:4];
                dig2 = ciphertext[11:8];
                dig3 = ciphertext[15:12];      
            end
            'b0010: begin
                dig0 = ciphertext[19:16];
                dig1 = ciphertext[23:20];
                dig2 = ciphertext[27:24];
                dig3 = ciphertext[31:28];      
            end
            'b0100: begin
                dig0 = ciphertext[35:32];
                dig1 = ciphertext[39:36];
                dig2 = ciphertext[43:40];
                dig3 = ciphertext[47:44];      
            end                      
            'b1000: begin             
                dig0 = ciphertext[51:48];
                dig1 = ciphertext[55:52];
                dig2 = ciphertext[59:56];
                dig3 = ciphertext[63:60];      
            end
            default: begin             
                dig0 = 'h0;
                dig1 = 'h0;
                dig2 = 'h0;
                dig3 = 'h0;      
            end
        endcase
    end else if (sw[2]) begin
        case (btn)
            'b0001: begin
                dig0 = deciphertext[3:0];
                dig1 = deciphertext[7:4];
                dig2 = deciphertext[11:8];
                dig3 = deciphertext[15:12];      
            end
            'b0010: begin
                dig0 = deciphertext[19:16];
                dig1 = deciphertext[23:20];
                dig2 = deciphertext[27:24];
                dig3 = deciphertext[31:28];      
            end
            'b0100: begin
                dig0 = deciphertext[35:32];
                dig1 = deciphertext[39:36];
                dig2 = deciphertext[43:40];
                dig3 = deciphertext[47:44];      
            end                      
            'b1000: begin             
                dig0 = deciphertext[51:48];
                dig1 = deciphertext[55:52];
                dig2 = deciphertext[59:56];
                dig3 = deciphertext[63:60];      
            end
            default: begin             
                dig0 = 'h0;
                dig1 = 'h0;
                dig2 = 'h0;
                dig3 = 'h0;      
            end
        endcase
    end else if (sw[3]) begin
        case (btn)
            'b0001: begin
                dig0 = key[3:0];
                dig1 = key[7:4];
                dig2 = key[11:8];
                dig3 = key[15:12];      
            end
            'b0010: begin
                dig0 = key[19:16];
                dig1 = key[23:20];
                dig2 = key[27:24];
                dig3 = key[31:28];      
            end
            'b0100: begin
                dig0 = key[35:32];
                dig1 = key[39:36];
                dig2 = key[43:40];
                dig3 = key[47:44];      
            end                      
            'b1000: begin             
                dig0 = key[51:48];
                dig1 = key[55:52];
                dig2 = key[59:56];
                dig3 = key[63:60];      
            end
            default: begin             
                dig0 = 'h0;
                dig1 = 'h0;
                dig2 = 'h0;
                dig3 = 'h0;      
            end
        endcase
    end else begin
        dig3 = 1'h0;
        dig2 = 1'h0;
        dig1 = 1'h0;
        dig0 = 1'h0;
    end
  end   // end
  
  
  // Increment logic
  assign NEXT_COUNT = CURRENT_COUNT == 17'd100000 ? 17'h00000 : CURRENT_COUNT + 1;

  // Creation of smaller clock signal from counters
  assign smol_clk = CURRENT_COUNT == 17'd100000 ? 1'b1 : 1'b0;



endmodule
