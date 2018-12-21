module cache_ass_conj(reset, clock, habilita, endereco, DIN, hit,  WB_needed, DOUT, WB, via0_lru, via1_lru);
	input reset, clock, habilita;
	input [3:0] endereco;
	input [7:0] DIN;
	output reg hit;
	output reg WB_needed;
	output reg [7:0] DOUT;	// Dado retornado (lido ou escrito)
	output reg [13:0] WB;

	//Ignorar os WB (Apenas deixamos para possibilidade de implementacao futura de um write back)
	// Nao usamos uma matriz para que o codigo fique mais
	// compreensivel
	// Via 0
	reg via0_v[3:0];				//Valido
	reg via0_d[3:0];				//Dirty
	reg [1:0] via0_tags[3:0];	//Tags
	reg [7:0] via0_data[3:0];	//Dados
	output reg [3:0]via0_lru;	//LRU
	
	// Via 1
	reg via1_v[3:0];				//Valido
	reg via1_d[3:0];				//Dirty
	reg [1:0] via1_tags[3:0];	//Tags
	reg [7:0] via1_data[3:0];	//Dados
	output reg [3:0]via1_lru;	//LRU
	
	// Variaveis auxiliares
	reg [1:0] index, tag;	
	
	// LEGENDA
	// Palavra menos recente: LRU = 1
	// Palavra mais recente: LRU = 0
	// Hit: hit = 1; Miss: hit = 0;
	

	always @(posedge clock, posedge reset) begin				// Logica de implementacao
		if (reset) begin
//    T	I     T  I
//		00 00		10 00
//		00 01		10 01
//		00 10		10 10
//		00 11		10 11
//		01 00		11 00
//		01 01		11 01
//		01 10		11 10
//		01 11		11 11
	
		// TODO: 
		// Inicializando via 0
		via0_v[0] <= 1'b0;
		via0_v[1] <= 1'b1;
		via0_v[2] <= 1'b0;
		via0_v[3] <= 1'b1;
															//VIA 0
		via0_d[0] <= 1'b0;							//0001	invalido  dado = 1     LRU=0
		via0_d[1] <= 1'b0;							//1101   valido	 dado = 2	  LRU=1
		via0_d[2] <= 1'b0;							//1011   invalido  dado = 4	  LRU=1
		via0_d[3] <= 1'b0;							//1110	valido    dado = 7     LRU=0
		
		via0_tags[0] <= 2'b01;
		via0_tags[1] <= 2'b11;
		via0_tags[2] <= 2'b11;
		via0_tags[3] <= 2'b10;
		
		via0_data[0] <= 8'b00000001;	//1
		via0_data[1] <= 8'b00000010;	//2
		via0_data[2] <= 8'b00000100;	//4
		via0_data[3] <= 8'b00000111;	//7
		
		via0_lru[0] <= 1'b0;
		via0_lru[1] <= 1'b1;
		via0_lru[2] <= 1'b1;
		via0_lru[3] <= 1'b0;
		
		// Inicializando via 1
		via1_v[0] <= 1'b0;
		via1_v[1] <= 1'b1;
		via1_v[2] <= 1'b1;
		via1_v[3] <= 1'b0;
															//VIA 1
		via1_d[0] <= 1'b0;							//0011 invalido dado = 10       LRU=1
		via1_d[1] <= 1'b1;							//0101 valido   dado = 8		  LRU=0
		via1_d[2] <= 1'b0;							//1010 valido   dado = 6		  LRU=0
		via1_d[3] <= 1'b0;  							//1111 invalido dado = 4		  LRU=1
		
		via1_tags[0] <= 2'b11;
		via1_tags[1] <= 2'b01;
		via1_tags[2] <= 2'b10;
		via1_tags[3] <= 2'b11;
		
		via1_data[0] <= 8'b00001010; //10
		via1_data[1] <= 8'b00001000; //8
		via1_data[2] <= 8'b00000110; //6
		via1_data[3] <= 8'b00000100; //4
		
		via1_lru[0] <= 1'b1;
		via1_lru[1] <= 1'b0;
		via1_lru[2] <= 1'b0;
		via1_lru[3] <= 1'b1;
		hit = 0;
	end else begin
			// Desmembrando o endereco
			index <= endereco[1:0];	//Indice 
			tag	<= endereco[3:2];	//TAG
			
			if (habilita) begin
				// Caso escrita
				if (via0_tags[index] == tag) begin		//CASO A VIA 0 POSSUA A RESPECTIVA TAG
					hit <= 1;									//Atualizacao de dados	
					via0_v[index] <= 1;	
					via0_d[index] <= 1;
					via0_tags[index][1:0] <= tag;
					via0_data[index][7:0] <= DIN;
					//Atualizacao do LRU
					via0_lru[index] <= 0;					
					via1_lru[index] <= 1;
					WB <= 0;
				end else if (via1_tags[index] == tag) begin	//CASO A VIA 1 POSSUA A RESPECTIVA TAG
					hit <= 1;											//Atualizacao de dados
					via1_v[index] <= 1;
					via1_d[index] <= 1;
					via1_tags[index][1:0] <= tag;
					via1_data[index][7:0] <= DIN;
					//Atualizacao do LRU
					via0_lru[index] <= 1;
					via1_lru[index] <= 0;
					WB <= 0;
				end else begin	
					//NENHUMA DAS VIAS ATENDERAM A CONDICAO
					hit <= 0;
					// TODO: Verificar WB
					if (via0_lru[index]) begin				//Se a LRU for a menos recente LRU = 1 entao...
						via0_v[index] <= 1;					//Atualizacao de dados
						via0_d[index] <= 1;
						via0_tags[index][1:0] <= tag;
						via0_data[index][7:0] <= DIN;
						//Atualizacao do LRU
						via0_lru[index] <= 0;
						via1_lru[index] <= 1;
						WB <= 1;
					end else begin
						via1_v[index] <= 1;
						via1_d[index] <= 1;
						via1_tags[index][1:0] <= tag;
						via1_data[index][7:0] <= DIN;						
						via0_lru[index] <= 1;
						via1_lru[index] <= 0;
						WB <= 1;
					end
				end
			end else begin
				// Caso leitura
				if (via0_tags[index] == tag) begin	//CASO A VIA 0 POSSUA A RESPECTIVA TAG
					if (via0_v[index]) begin			//SE FOR VALIDO
						hit <= 1;							//Atualizacao de dados
						// enviando dado
						DOUT <= via0_data[index];		//Saida do dado
						//Atualizacao do LRU
						via0_lru[index] <= 0;			
						via1_lru[index] <= 1;
						WB <= 0;
					end else begin
						// A tag existe no conjunto, mas nao e valida --- MISS
						// WB
						hit <= 0;
						WB <= 1;
					end
				end else if (via1_tags[index] == tag) begin	//CASO A VIA 1 POSSUA A TAG
					if (via1_v[index]) begin						//SE FOR VALIDO
						hit <= 1;										//Atualizacao de dados
						// enviando dado
						DOUT <= via1_data[index];		//Saida do dado
						//Atualizacao do LRU
						via0_lru[index] <= 1;
						via1_lru[index] <= 0;
						WB <= 0;
					end else begin
						// A tag existe no conjunto, mas nao e valida
						hit <= 0;  //MISS
						WB <= 1;
						// WB
					end
				end else begin
					// A cache nao existe no conjunto
					hit <= 0;
					WB <= 1;
					// WB;
				end
			end
		end
	end
endmodule

