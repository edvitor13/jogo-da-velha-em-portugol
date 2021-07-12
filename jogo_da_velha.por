programa
{
	
	funcao inicio()
	{
		// Declarando variáveis
		inteiro jogo_da_velha[3][3] = {
			{0, 0, 0},	
			{0, 0, 0},	
			{0, 0, 0}
		}
		// Matriz com coordenadas de vitória caso completas
		inteiro jogo_da_velha_vitorias[8][6] = {
			// Linhas
			{0, 0,  0, 1,  0, 2},
			{1, 0,  1, 1,  1, 2},
			{2, 0,  2, 1,  2, 2},
			// Colunas
			{0, 0,  1, 0,  2, 0},
			{0, 1,  1, 1,  2, 1},
			{0, 2,  1, 2,  2, 2},
			// Diagonais
			{0, 0,  1, 1,  2, 2},
			{2, 0,  1, 1,  0, 2}
		}
		// Armazenar coordenadas do vencedor, caso aja
		inteiro coordenadas_vencedoras[6] = {0, 0, 0, 0, 0, 0}
		// Armazenar nomes dos jogadores e qual o nome atual durante o jogo
		cadeia jogador1, jogador2, jogador_atual
		// Contadores para os loops
		inteiro contador_de_rodadas, contador_verificar_vitorias, contador_verificar_vitorias_coordenadas, jogo_linha, jogo_coluna
		// Jogadas dos jogadores
		inteiro jogador_atual_linha, jogador_atual_coluna, jogador_atual_numero, jogador_vencedor
		inteiro verificador_de_vitoria = 0
		inteiro vencedor = 0

		// Declarando informações base do jogo
		contador_de_rodadas = 0
		jogador_vencedor = 0

		// Escolhendo jogadores
		escreva("Escolha o nome do Jogador 1: ")
		leia(jogador1)
		escreva("Escolha o nome do Jogador 2: ")
		leia(jogador2)

		// Iniciando laço do jogo (por rodadas)
		escreva("\n") // Dando uma quebra de linha
		faca {
			
			// Verificando qual o jogador da vez
			// Se a rodada for um número par, o jogador da vez será o 1
			se (contador_de_rodadas % 2 == 0) {
				jogador_atual_numero = 1
				jogador_atual = jogador1
			// Se a rodada for ímpar, o jogador da vez será o 2
			} senao {
				jogador_atual_numero = 2
				jogador_atual = jogador2
			}

			// Verificando se alguém venceu
			contador_verificar_vitorias = 0
			faca {
				// Verificando Linhas/Colunas/Diagonais completas
				verificador_de_vitoria = 0
				vencedor = 0
				contador_verificar_vitorias_coordenadas = 0
				faca {
					// Checando cada coordenada que pode definir a vitória
					escolha(
						jogo_da_velha
						[jogo_da_velha_vitorias[contador_verificar_vitorias][contador_verificar_vitorias_coordenadas]]
						[jogo_da_velha_vitorias[contador_verificar_vitorias][contador_verificar_vitorias_coordenadas + 1]]	
					) {
						caso 1:
							se (vencedor == 0 ou vencedor == 1) {
								vencedor = 1
								verificador_de_vitoria++
							}
						pare
						
						caso 2:
							se (vencedor == 0 ou vencedor == 2) {
								vencedor = 2
								verificador_de_vitoria++
							}
						pare
					}
					// Armazenando coordendas verificadas (Para exibir de forma diferente no print do jogo)
					coordenadas_vencedoras[contador_verificar_vitorias_coordenadas] = jogo_da_velha_vitorias[contador_verificar_vitorias][contador_verificar_vitorias_coordenadas]
					coordenadas_vencedoras[contador_verificar_vitorias_coordenadas + 1] = jogo_da_velha_vitorias[contador_verificar_vitorias][contador_verificar_vitorias_coordenadas + 1]

					// Somando contador
					contador_verificar_vitorias_coordenadas = contador_verificar_vitorias_coordenadas + 2
				} enquanto(contador_verificar_vitorias_coordenadas < 6)

				// Caso tenha conseguido completar ao menos 3 blocos de seguimento válido
				se (verificador_de_vitoria == 3) {
					// Modificando valores dos jogadores para exibir -X- ou -O- nas linhas vencedoras
					contador_verificar_vitorias_coordenadas = 0
					faca {
						jogo_da_velha
						[ coordenadas_vencedoras[contador_verificar_vitorias_coordenadas] ]
						[ coordenadas_vencedoras[contador_verificar_vitorias_coordenadas + 1] ]
						= vencedor * 100

						contador_verificar_vitorias_coordenadas = contador_verificar_vitorias_coordenadas + 2
					} enquanto(contador_verificar_vitorias_coordenadas < 6)
					pare
				} senao {
					vencedor = 0	
				}
				
				contador_verificar_vitorias++
			} enquanto(contador_verificar_vitorias < 8)
			
			// Mostrando jogo da velha atual
			escreva("[SUPER JOGO DA VELHA - RODADA Nº" + (contador_de_rodadas + 1) + "]" + "\n")
			// Percorrendo linhas
			jogo_linha = 0
			faca {
				// Percorrendo colunas
				jogo_coluna = 0
				faca {
					// Mostrando ícones com base nos números
					escolha (jogo_da_velha[jogo_linha][jogo_coluna]) {
						// Jogadas normais
						caso 1:
							escreva("[O] ")
						pare

						caso 2:
							escreva("[X] ")
						pare

						// Jogadas Vencedoras
						caso 100:
							escreva("-O- ")
						pare
						
						caso 200:
							escreva("-X- ")
						pare

						// Sem jogadas
						caso contrario:
							escreva("[ ] ")
					}
					
					jogo_coluna++
					
				} enquanto (jogo_coluna < 3)

				escreva("\n") // Quebra de Linha
				
				jogo_linha++

			} enquanto (jogo_linha < 3)

			
			// Verificando se o jogo terminou ou não
			// com base no número máximo de rodadas
			se (contador_de_rodadas == 9) {
				se (vencedor != 0) {
					se (vencedor == 1) {
						escreva("\nParabéns " + jogador1 + ", você venceu!!")
					} senao {
						escreva("\nParabéns " + jogador2 + ", você venceu!!")
					}
				} senao {
					escreva("\nDeu velha!")
				}
				
				escreva("\n-- Jogo encerrado --\n")
				pare // Parando o loop de rodadas
				
			// Verificando se o jogo acabou com base no vencedor diferente de 0
			} senao se (vencedor != 0) {
				se (vencedor == 1) {
					escreva("\nParabéns " + jogador1 + ", você venceu!!")
				} senao {
					escreva("\nParabéns " + jogador2 + ", você venceu!!")
				}

				escreva("\n-- Jogo encerrado --\n")
				pare // Parando o loop de rodadas
			}
			

			// Fazer o jogador escolher as positções
			faca {
				// Perguntando as posições que o jogador atual deseja
				escreva("\n")
				// Linha
				escreva(">> " + jogador_atual + ", escolha a linha: ")
				leia(jogador_atual_linha)
				// Coluna
				escreva(">> " + jogador_atual + ", escolha a coluna: ")
				leia(jogador_atual_coluna)
	
				escreva("\n")

				// Se o jogador informar uma posição que não existe
				se (
					(jogador_atual_linha < 1 ou jogador_atual_linha > 3) ou
					(jogador_atual_coluna < 1 ou jogador_atual_coluna > 3)
				) {
					// Envia aviso que a escolha foi incorreta e solicita novamente
					escreva("A posição " + jogador_atual_linha + "x" + jogador_atual_coluna + " não existe!\nTente novamente:\n")
				// Se a posição escolhida já tem algum número diferente de 0
				} senao se (jogo_da_velha[jogador_atual_linha - 1][jogador_atual_coluna - 1] != 0) {
					// Envia aviso que a escolha foi incorreta e solicita novamente
					escreva("A posição " + jogador_atual_linha + "x" + jogador_atual_coluna + " já foi jogada!\nTente novamente:\n")
				// Se não tiver, troca o 0 pelo valor do jogador na posição escolhida
				} senao {
					// Mudando valor na matriz do jogo
					jogo_da_velha[jogador_atual_linha - 1][jogador_atual_coluna - 1] = jogador_atual_numero
					// Para este loop para não solicitar novamente as coordenadas
					pare
				}
			} enquanto (verdadeiro)

			contador_de_rodadas++
		} enquanto (contador_de_rodadas <= 9)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5076; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */