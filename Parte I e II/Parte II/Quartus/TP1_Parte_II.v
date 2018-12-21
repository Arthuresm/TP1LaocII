module disp7seg(binario, decodificacao);
	parameter tamanho = 6;
		
	input [tamanho - 1:0] binario;
	output reg [6:0] decodificacao;
	
	always @(binario) begin
	case(binario) //					               abcdefg
			8'b00000000: decodificacao = 7'b0000001; // 0
			8'b00000001: decodificacao = 7'b1001111; // 1
			8'b00000010: decodificacao = 7'b0010010; // 2
			8'b00000011: decodificacao = 7'b0000110; // 3
			8'b00000100: decodificacao = 7'b1001100; // 4
			8'b00000101: decodificacao = 7'b0100100; // 5
			8'b00000110: decodificacao = 7'b0100000; // 6
			8'b00000111: decodificacao = 7'b0001101; // 7
			8'b00001000: decodificacao = 7'b1111111; // 8
			8'b00001001: decodificacao = 7'b0000100; // 9
			8'b00001010: decodificacao = 7'b0001000; // A
			8'b00001011: decodificacao = 7'b1100000; // b
			8'b00001100: decodificacao = 7'b0110001; // C
			8'b00001101: decodificacao = 7'b1000010; // d
			8'b00001110: decodificacao = 7'b0110000; // E
			8'b00001111: decodificacao = 7'b0111000; // F
	endcase
	end
endmodule

// Para a placa
//module TP1_Parte_II(SW, HEX0, HEX1, HEX2, HEX3, HEX4);
//	
//	input [17:0] SW;
//	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4;
//	
//	wire [4:0] address; 
//	wire clock; 
//	wire [7:0] data; 
//	wire wren;
//	wire [7:0] q;
//	
//	assign address = SW[4:0]; // endereco a ser lido/escrito na memoria
//	assign clock = SW[17]; 
//	assign data = SW[13:6]; // dado a ser escrito na memoria
//	assign wren = SW[15]; // habilia escrita
//	
//	ramLPM ram(address, clock, data, wren, q);
//	
//	disp7seg dispSeg0(q, HEX0); //Dado lido da memoria
//	assign HEX1=7'b1111111;		 //Separador
//	disp7seg dispSeg2(address, HEX2);//Endereco
//   assign HEX3=7'b1111111;		//Separador
// 	disp7seg dispSeg4(data, HEX4);	//Dado inserido
// 	
//endmodule 

// Para a simulacao
module TP1_Parte_II(address, clock, data, wren, q);
	
	input [4:0] address; 
	input clock; 
	input [7:0] data; 
	input wren;
	output [7:0] q;
	
	ramLPM ram(address, clock, data, wren, q);
 	
endmodule
