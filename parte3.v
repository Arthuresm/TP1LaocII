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
			8'b00001000: decodificacao = 7'b0000000; // 8
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



module parte3(SW, LEDG, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4 , HEX7, HEX6);
	input [17:0] SW;
	output [0:0] LEDG;
	output [17:0] LEDR;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4 , HEX7, HEX6;
	
	wire hit, clock, habilita, reset, wb;
	wire [3:0] endereco;
	wire [7:0] dado;	//Dado de entrada
	wire [13:0]wb_p;	
	wire [7:0]q;		//Dado de saida
	
	
	assign LEDG[0:0] = hit;		//Ativa com sinal logico alto
	assign LEDR[0:0] = ~hit;		//Ativa com sinal logico alto	----MISS
	assign clock = SW[17];
	assign habilita = SW[15];
	assign reset = SW[14];
	assign LEDR[15] = reset;
	assign LEDR[14] = reset;
	assign LEDR[13] = reset;
	
	assign dado = SW[13:6];
	assign endereco = SW[3:0];
	
	
	cache_ass_conj dut(reset, clock, habilita, endereco, dado, hit, wb, q, wb_p);
	
	disp7seg dispSeg0(q, HEX0); //Dado lido da memoria
	assign HEX1=7'b1111111;		 //Separador
	disp7seg dispSeg2(endereco, HEX2);//Endereco
	assign HEX3=7'b1111111;		//Separador
	disp7seg dispSeg4(dado, HEX4);	//Dado inserido
	
	disp7seg dispSeg6(endereco[1:0],HEX6);
	disp7seg dispSeg7(endereco[3:2],HEX7);
	
endmodule
