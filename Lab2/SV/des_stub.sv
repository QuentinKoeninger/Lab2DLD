/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;

   logic [27:0] templeft;
   logic [27:0] tempright;

	PC1 instPC1 (Key, templeft, tempright);
	leftShift left1 (0, templeft, tempright, templeft, tempright);

	PC2 inst1PC2 (templeft, tempright, SubKey1);
	leftShift left2 (0, templeft, tempright, templeft, tempright);

	PC2 inst2PC2 (templeft, tempright, SubKey1);
	leftShift left3 (1, templeft, tempright, templeft, tempright);

	PC2 inst3PC2 (templeft, tempright, SubKey1);
	leftShift left4 (1, templeft, tempright, templeft, tempright);

	PC2 inst4PC2 (templeft, tempright, SubKey1);
	leftShift left5 (1, templeft, tempright, templeft, tempright);

	PC2 inst5PC2 (templeft, tempright, SubKey1);
	leftShift left6 (1, templeft, tempright, templeft, tempright);

	PC2 inst6PC2 (templeft, tempright, SubKey1);
	leftShift left7 (1, templeft, tempright, templeft, tempright);

	PC2 inst7PC2 (templeft, tempright, SubKey1);
	leftShift left8 (1, templeft, tempright, templeft, tempright);

	PC2 inst8PC2 (templeft, tempright, SubKey1);
	leftShift left9 (0, templeft, tempright, templeft, tempright);

	PC2 inst9PC2 (templeft, tempright, SubKey1);
	leftShift left10 (1, templeft, tempright, templeft, tempright);

	PC2 inst10PC2 (templeft, tempright, SubKey1);
	leftShift left11 (1, templeft, tempright, templeft, tempright);

	PC2 inst11PC2 (templeft, tempright, SubKey1);
	leftShift left12 (1, templeft, tempright, templeft, tempright);

	PC2 inst12PC2 (templeft, tempright, SubKey1);
	leftShift left13 (1, templeft, tempright, templeft, tempright);

	PC2 inst13PC2 (templeft, tempright, SubKey1);
	leftShift left14 (1, templeft, tempright, templeft, tempright);

	PC2 inst13PC2 (templeft, tempright, SubKey1);
	leftShift left15 (1, templeft, tempright, templeft, tempright);

	PC2 inst15PC2 (templeft, tempright, SubKey1);
	leftShift left16 (0, templeft, tempright, templeft, tempright);

	PC2 inst16PC2 (templeft, tempright, SubKey1);

	
	

endmodule // GenerateKeys

module leftShift[iteration, left_block, right_block, out_left, out_right];

	input logic iteration;
	input logic left_block[27:0];
	input logic right_block[27:0];
	output logic out_left[27:0];
	output logic out_right[27:0];

	if (iteration) begin
		out_left = {left_block[1:0], left_block[27:2]};
		out_right ={right_block[1:0], right_block[27:2]};
	end else begin
		out_left = {left_block[0], left_block[27:1]};
		out_right ={right_block[0], right_block[27:1]};
	end

endmodule // shift the bits (iteration) to the left

module PC1 (key, left_block, right_block);

   input logic [63:0]  key;
   output logic [27:0] left_block;
   output logic [27:0] right_block;
   logic [55:0]        out_block;
//    logic [1:0]	temp;

	assign out_block[55] = key[64 - 57];
	assign out_block[54] = key[64 - 49];
	assign out_block[53] = key[64 - 41];
	assign out_block[52] = key[64 - 33];
	assign out_block[51] = key[64 - 25];
	assign out_block[50] = key[64 - 17];
	assign out_block[49] = key[64 - 9];
	assign out_block[48] = key[64 - 1];
	assign out_block[47] = key[64 - 58];
	assign out_block[46] = key[64 - 50];
	assign out_block[45] = key[64 - 42];
	assign out_block[44] = key[64 - 34];
	assign out_block[43] = key[64 - 26];
	assign out_block[42] = key[64 - 18];
	assign out_block[41] = key[64 - 10];
	assign out_block[40] = key[64 - 2];
	assign out_block[39] = key[64 - 59];
	assign out_block[38] = key[64 - 51];
	assign out_block[37] = key[64 - 43];
	assign out_block[36] = key[64 - 35];
	assign out_block[35] = key[64 - 27];
	assign out_block[34] = key[64 - 19];
	assign out_block[33] = key[64 - 11];
	assign out_block[32] = key[64 - 3];
	assign out_block[31] = key[64 - 60];
	assign out_block[30] = key[64 - 52];
	assign out_block[29] = key[64 - 44];
	assign out_block[28] = key[64 - 36];
	assign out_block[27] = key[64 - 63];
	assign out_block[26] = key[64 - 55];
	assign out_block[25] = key[64 - 47];
	assign out_block[24] = key[64 - 39];
	assign out_block[23] = key[64 - 31];
	assign out_block[22] = key[64 - 23];
	assign out_block[21] = key[64 - 15];
	assign out_block[20] = key[64 - 7];
	assign out_block[19] = key[64 - 62];
	assign out_block[18] = key[64 - 54];
	assign out_block[17] = key[64 - 46];
	assign out_block[16] = key[64 - 38];
	assign out_block[15] = key[64 - 30];
	assign out_block[14] = key[64 - 22];
	assign out_block[13] = key[64 - 14];
	assign out_block[12] = key[64 - 6];
	assign out_block[11] = key[64 - 61];
	assign out_block[10] = key[64 - 53];
	assign out_block[9] = key[64 - 45];
	assign out_block[8] = key[64 - 37];
	assign out_block[7] = key[64 - 29];
	assign out_block[6] = key[64 - 21];
	assign out_block[5] = key[64 - 13];
	assign out_block[4] = key[64 - 5];
	assign out_block[3] = key[64 - 28];
	assign out_block[2] = key[64 - 20];
	assign out_block[1] = key[64 - 12];
	assign out_block[0] = key[64 - 4];

	assign left_block[27:0] = outblock[55:28];
	assign right_block[27:0] = outblock[27:0];
	// // Assign Left block
    // assign left_block[27:21] = key[62:56];
	// assign left_block[20:14] = key[54:48];
	// assign left_block[13:7] = key[46:40];
	// assign left_block[6:0] = key[38:32];

	// // Assign right block
	// assign right_block[27:21] = key[30:24];
	// assign right_block[20:14] = key[22:16];
	// assign right_block[13:7] = key[14:8];
	// assign right_block[6:0] = key[6:0];

	// if (iteration) begin						// Shift left by two for both blocks
	// 	assign temp[1:0] = left_block[27:26];
	// 	assign left_block = left_block << 2;
	// 	assign leftblock[1:0] = temp[1:0];

	// 	assign temp[1:0] = right_block[27:26];
	// 	assign right_block = right_block << 2;
	// 	assign right_block[1:0] = temp[1:0];
	// end else begin								// Shift left by 1 for both blocks
	// 	assign temp[0] = left_block[27];
	// 	assign left_block = left_block << 2;
	// 	assign leftblock[0] = temp[0];

	// 	assign temp[0] = right_block[27];
	// 	assign right_block = right_block << 2;
	// 	assign right_block[0] = temp[0];
	// end
endmodule // PC1

module PC2 (left_block, right_block, subkey);

   input logic [27:0] left_block;
   input logic [27:0] right_block;
   output logic [47:0] subkey;
   logic [55:0] key;
   
   assign key = {left_block[27:0], right_block[27:0]};

	assign subkey[47] = key[56 - 14];
	assign subkey[46] = key[56 - 17];
	assign subkey[45] = key[56 - 11];
	assign subkey[44] = key[56 - 24];
	assign subkey[43] = key[56 - 1];
	assign subkey[42] = key[56 - 5];
	assign subkey[41] = key[56 - 3];
	assign subkey[40] = key[56 - 28];
	assign subkey[39] = key[56 - 15];
	assign subkey[38] = key[56 - 6];
	assign subkey[37] = key[56 - 21];
	assign subkey[36] = key[56 - 10];
	assign subkey[35] = key[56 - 23];
	assign subkey[34] = key[56 - 19];
	assign subkey[33] = key[56 - 12];
	assign subkey[32] = key[56 - 4];
	assign subkey[31] = key[56 - 26];
	assign subkey[30] = key[56 - 8];
	assign subkey[29] = key[56 - 16];
	assign subkey[28] = key[56 - 7];
	assign subkey[27] = key[56 - 27];
	assign subkey[26] = key[56 - 20];
	assign subkey[25] = key[56 - 13];
	assign subkey[24] = key[56 - 2];
	assign subkey[23] = key[56 - 41];
	assign subkey[22] = key[56 - 52];
	assign subkey[21] = key[56 - 31];
	assign subkey[20] = key[56 - 37];
	assign subkey[19] = key[56 - 47];
	assign subkey[18] = key[56 - 55];
	assign subkey[17] = key[56 - 30];
	assign subkey[16] = key[56 - 40];
	assign subkey[15] = key[56 - 51];
	assign subkey[14] = key[56 - 45];
	assign subkey[13] = key[56 - 33];
	assign subkey[12] = key[56 - 48];
	assign subkey[11] = key[56 - 44];
	assign subkey[10] = key[56 - 49];
	assign subkey[9] = key[56 - 39];
	assign subkey[8] = key[56 - 56];
	assign subkey[7] = key[56 - 34];
	assign subkey[6] = key[56 - 53];
	assign subkey[5] = key[56 - 46];
	assign subkey[4] = key[56 - 42];
	assign subkey[3] = key[56 - 50];
	assign subkey[2] = key[56 - 36];
	assign subkey[1] = key[56 - 29];
	assign subkey[0] = key[56 - 32];

endmodule // PC2

// Straight Function
module SF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [31:0] out_block;

	assign out_block[31] = inp_block[32 - 16];
	assign out_block[30] = inp_block[32 - 7];
	assign out_block[29] = inp_block[32 - 20];
	assign out_block[28] = inp_block[32 - 21];
	assign out_block[27] = inp_block[32 - 29];
	assign out_block[26] = inp_block[32 - 12];
	assign out_block[25] = inp_block[32 - 28];
	assign out_block[24] = inp_block[32 - 17];
	assign out_block[23] = inp_block[32 - 1];
	assign out_block[22] = inp_block[32 - 15];
	assign out_block[21] = inp_block[32 - 23];
	assign out_block[20] = inp_block[32 - 26];
	assign out_block[19] = inp_block[32 - 5];
	assign out_block[18] = inp_block[32 - 18];
	assign out_block[17] = inp_block[32 - 31];
	assign out_block[16] = inp_block[32 - 10];
	assign out_block[15] = inp_block[32 - 2];
	assign out_block[14] = inp_block[32 - 8];
	assign out_block[13] = inp_block[32 - 24];
	assign out_block[12] = inp_block[32 - 14];
	assign out_block[11] = inp_block[32 - 32];
	assign out_block[10] = inp_block[32 - 27];
	assign out_block[9] = inp_block[32 - 3];
	assign out_block[8] = inp_block[32 - 9];
	assign out_block[7] = inp_block[32 - 19];
	assign out_block[6] = inp_block[32 - 13];
	assign out_block[5] = inp_block[32 - 30];
	assign out_block[4] = inp_block[32 - 6];
	assign out_block[3] = inp_block[32 - 22];
	assign out_block[2] = inp_block[32 - 11];
	assign out_block[1] = inp_block[32 - 3];
	assign out_block[0] = inp_block[32 - 25];

endmodule // SF

// Expansion Function
module EF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [47:0] out_block;

   assign out_block[47] = inp_block[32 - 32];
	assign out_block[46] = inp_block[32 - 1];
	assign out_block[45] = inp_block[32 - 2];
	assign out_block[44] = inp_block[32 - 3];
	assign out_block[43] = inp_block[32 - 4];
	assign out_block[42] = inp_block[32 - 5];
	assign out_block[41] = inp_block[32 - 4];
	assign out_block[40] = inp_block[32 - 5];
	assign out_block[39] = inp_block[32 - 6];
	assign out_block[38] = inp_block[32 - 7];
	assign out_block[37] = inp_block[32 - 8];
	assign out_block[36] = inp_block[32 - 9];
	assign out_block[35] = inp_block[32 - 8];
	assign out_block[34] = inp_block[32 - 9];
	assign out_block[33] = inp_block[32 - 10];
	assign out_block[32] = inp_block[32 - 11];
	assign out_block[31] = inp_block[32 - 12];
	assign out_block[30] = inp_block[32 - 13];
	assign out_block[29] = inp_block[32 - 12];
	assign out_block[28] = inp_block[32 - 13];
	assign out_block[27] = inp_block[32 - 14];
	assign out_block[26] = inp_block[32 - 15];
	assign out_block[25] = inp_block[32 - 16];
	assign out_block[24] = inp_block[32 - 17];
	assign out_block[23] = inp_block[32 - 16];
	assign out_block[22] = inp_block[32 - 17];
	assign out_block[21] = inp_block[32 - 18];
	assign out_block[20] = inp_block[32 - 19];
	assign out_block[19] = inp_block[32 - 20];
	assign out_block[18] = inp_block[32 - 21];
	assign out_block[17] = inp_block[32 - 20];
	assign out_block[16] = inp_block[32 - 21];
	assign out_block[15] = inp_block[32 - 22];
	assign out_block[14] = inp_block[32 - 23];
	assign out_block[13] = inp_block[32 - 24];
	assign out_block[12] = inp_block[32 - 25];
	assign out_block[11] = inp_block[32 - 24];
	assign out_block[10] = inp_block[32 - 25];
	assign out_block[9] = inp_block[32 - 26];
	assign out_block[8] = inp_block[32 - 27];
	assign out_block[7] = inp_block[32 - 28];
	assign out_block[6] = inp_block[32 - 29];
	assign out_block[5] = inp_block[32 - 28];
	assign out_block[4] = inp_block[32 - 29];
	assign out_block[3] = inp_block[32 - 30];
	assign out_block[2] = inp_block[32 - 31];
	assign out_block[1] = inp_block[32 - 32];
	assign out_block[0] = inp_block[32 - 1];

endmodule // EF

module feistel (inp_block, subkey, out_block);

   input logic [31:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [31:0] out_block;

   logic [47:0] temp_block;
   logic [47:0] xor_out;
   logic [31:0] sboxresults;

   EF instEF (inp_block, temp_block);

   assign xor_out = temp_block ^ subkey;

	S1_Box instS1 (xor_out[47:42], sboxresults[31:28]);
	S2_Box instS2 (xor_out[41:36], sboxresults[27:24]);
	S3_Box instS3 (xor_out[35:30], sboxresults[23:20]);
	S4_Box instS4 (xor_out[29:24], sboxresults[19:16]);
	S5_Box instS5 (xor_out[23:18], sboxresults[15:12]);
	S6_Box instS6 (xor_out[17:12], sboxresults[11:8]);
	S7_Box instS7 (xor_out[11:6], sboxresults[7:4]);
	S1_Box instS1 (xor_out[5:0], sboxresults[3:0]);

	SF instSF (sboxresults, out_block);

endmodule // Feistel

// DES block round
module round (inp_block, subkey, out_block);

   input logic [63:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;

   logic [31:0] inp_left;
   logic [31:0] inp_right;
   logic [31:0] fei_out;

   assign inp_left = inp_block[63:32];
   assign inp_right = inp_block[31:0];

   feistel instfeistel (inp_right, subkey, fei_out);

	assign out_block[31:0] = fei_out ^ inp_left;
	assign out_block[63:32] = inp_right;

endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9] = inp_block[64-13];
   assign out_block[8] = inp_block[64-5];
   assign out_block[7] = inp_block[64-63];
   assign out_block[6] = inp_block[64-55];
   assign out_block[5] = inp_block[64-47];
   assign out_block[4] = inp_block[64-39];   
   assign out_block[3] = inp_block[64-31];
   assign out_block[2] = inp_block[64-23];    
   assign out_block[1] = inp_block[64-15];
   assign out_block[0] = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9] = inp_block[64-58];
   assign out_block[8] = inp_block[64-26];   
   assign out_block[7] = inp_block[64-33];
   assign out_block[6] = inp_block[64-1];
   assign out_block[5] = inp_block[64-41];   
   assign out_block[4] = inp_block[64-9];
   assign out_block[3] = inp_block[64-49];    
   assign out_block[2] = inp_block[64-17];
   assign out_block[1] = inp_block[64-57];
   assign out_block[0] = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (input logic [63:0] key, input logic [63:0] plaintext, 
	    input logic encrypt, output logic [63:0] ciphertext);

   logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
   logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
   logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
   logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;

   logic [63:0] 	ip_out;
   logic [63:0] 	r1_out = 64'h0; 
   logic [63:0] 	r2_out = 64'h0; 
   logic [63:0] 	r3_out = 64'h0; 
   logic [63:0] 	r4_out = 64'h0; 
   logic [63:0] 	r5_out = 64'h0; 
   logic [63:0] 	r6_out = 64'h0; 
   logic [63:0] 	r7_out = 64'h0; 
   logic [63:0] 	r8_out = 64'h0; 
   logic [63:0] 	r9_out = 64'h0; 
   logic [63:0] 	r10_out = 64'h0; 
   logic [63:0] 	r11_out = 64'h0; 
   logic [63:0] 	r12_out = 64'h0; 
   logic [63:0] 	r13_out = 64'h0; 
   logic [63:0] 	r14_out = 64'h0;    
   logic [63:0] 	r15_out = 64'h0; 
   logic [63:0] 	r16_out = 64'h0; 
   logic [63:0]	tempkey;  
   
   // SubKey generation
   GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
		    SubKey5, SubKey6, SubKey7, SubKey8,
		    SubKey9, SubKey10, SubKey11, SubKey12,
		    SubKey13, SubKey14, SubKey15, SubKey16);
   // encrypt (encrypt=1) or decrypt (encrypt=0) xxxxxxxxxxxxxxxxx

   // Initial Permutation (IP)
   IP b1 (plaintext, ip_out);
   // round 1
   assign tempkey = encrypt ? SubKey1 : SubKey16;
   round round1 (ip_out, tempkey, r1_out);
   // round 2
   assign tempkey = encrypt ? SubKey2 : SubKey15;
   round round2 (r1_out, tempkey, r2_out);
   // round 3
   assign tempkey = encrypt ? SubKey3 : SubKey14;
   round round3 (r2_out, tempkey, r3_out);
   // round 4
   assign tempkey = encrypt ? SubKey4 : SubKey13;
   round round4 (r3_out, tempkey, r4_out);
   // round 5
   assign tempkey = encrypt ? SubKey5 : SubKey12;
   round round5 (r4_out, tempkey, r5_out);
   // round 6
   assign tempkey = encrypt ? SubKey6 : SubKey11;
   round round6 (r5_out, tempkey, r6_out);
   // round 7
   assign tempkey = encrypt ? SubKey7 : SubKey10;
   round round7 (r6_out, tempkey, r7_out);
   // round 8
   assign tempkey = encrypt ? SubKey8 : SubKey9;
   round round8 (r7_out, tempkey, r8_out);
   // round 9
   assign tempkey = encrypt ? SubKey9 : SubKey8;
   round round9 (r8_out, tempkey, r9_out);
   // round 10
   assign tempkey = encrypt ? SubKey10 : SubKey7;
   round round10 (r9_out, tempkey, r10_out);
   // round 11
   assign tempkey = encrypt ? SubKey11 : SubKey6;
   round round11 (r10_out, tempkey, r11_out);
   // round 12
   assign tempkey = encrypt ? SubKey12 : SubKey5;
   round round12 (r11_out, tempkey, r12_out);
   // round 13
   assign tempkey = encrypt ? SubKey13 : SubKey4;
   round round13 (r12_out, tempkey, r13_out);
   // round 14
   assign tempkey = encrypt ? SubKey14 : SubKey3;
   round round14 (r13_out, tempkey, r14_out);
   // round 15
   assign tempkey = encrypt ? SubKey15 : SubKey2;
   round round15 (r14_out, tempkey, r15_out);
   // round 16
   assign tempkey = encrypt ? SubKey16 : SubKey1;
	round round16 (r15_out, tempkey, r16_out);	
   // Final Permutation (IP^{-1}) (swap output of round16)
   FP FP({r16_out[31:0], r16_out[63:32]}, ciphertext);
   
endmodule // DES


