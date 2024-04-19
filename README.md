# Jogo da Forca 

Paradigma:
 - Funcional
   
**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo (de acordo com a Planilha de Divisão dos Grupos)**: 05<br>
**Paradigma**: Funcional<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 19/0113596  |  Charles Manrique Serafim Morais |
| 19/0045485  |  Eduardo Gurgel Pereira de Carvalho |
| 19/0125829  |  Ian da Costa Gama |
| 19/0134623  |  Marcos Diego da Silva Gomes |
| 19/0058587  |  Matheus Raphael Soares de Oliveira |
| 14/0158278  |  Pedro Helias Carlos  |
| 21/1006957  |  Sebastián Héctor Zuzunaga Rosado  |
| 19/0117508  |  Thiago Cerqueira Borges  |

## Sobre 
Haskell é uma linguagem de programação poderosa e expressiva que oferece diversas vantagens para o desenvolvimento de software. Em nosso projeto, utilizamos alguns recuros como:
- **Leitura de arquivo** O jogo lê um arquivo de texto contendo palavras e seleciona uma delas aleatoriamente.
- **Sistema Funcional**: O jogador deve adivinhar a palavra, letra por letra, até preencher a palavra corretamente.
- **Sistema de Vidas**: O jogador tem um total de 6 “vidas” (ou chutes). Se errar 6 letras, perde o jogo.
- **Sorteio de Nova Palavra**: Com 30% de chance, o sistema sorteia uma nova palavra quando faltar apenas uma letra para completar a atual.
### Comunidade
- Site oficial da Haskell: https://www.haskell.org/haskellwiki/Haskell
- Documentação da linguagem Haskell: https://www.haskell.org/documentation/
- Livro "Learn You a Haskell for Great Good": https://learnyouahaskell.github.io/
- Repositório de reimplementações do jogo da forca em Haskell: https://github.com/haskell
- [Hangman game](https://hackage.haskell.org/package/PlayHangmanGame)

## Screenshots
### Tela inicial
![image](https://github.com/UnBParadigmas2024-1/2024.1_G5_Funcional_Jogo_da_Forca/assets/51385738/0e37a91d-4320-48ad-ac21-cc91b906c3b5)
### Verificando Letra
![image](https://github.com/UnBParadigmas2024-1/2024.1_G5_Funcional_Jogo_da_Forca/assets/51385738/8c73cceb-bcf3-49e6-939d-59ecdb52c894)
### Tela de derrota
![image](https://github.com/UnBParadigmas2024-1/2024.1_G5_Funcional_Jogo_da_Forca/assets/51385738/3dfcd479-7c07-4119-ac32-e289e8a131bd)
### Vitória
![image](https://github.com/UnBParadigmas2024-1/2024.1_G5_Funcional_Jogo_da_Forca/assets/51385738/b2c83bf4-0357-4ced-b55e-96fa1a2f9aaa)


## Instalação 
Durante o processo nós utilizamos o Cabal para gerar a build e run na aplicação

![gYEXj](https://github.com/UnBParadigmas2024-1/2024.1_G5_Funcional_Jogo_da_Forca/assets/51385738/ca879853-a8b4-4921-b8f0-0ffd6b008b4b)


#### Para gerar a build
``
Cabal build 
``
#### Para executar
``
Cabal run 
``
## Uso 
Pequena ilustração básica de como utilizar o Game
![Design sem nome](https://github.com/UnBParadigmas2024-1/2024.1_G5_Funcional_Jogo_da_Forca/assets/51385738/6c1f2022-729d-429b-a6c9-2152395bf39e)


## Vídeo
Aqui está o nosso vídeo de Apresentação
[Vídeo de Apresentação - Youtube](https://www.youtube.com/watch?v=8LPL6h5cWQc)

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Eduardo Gurgel Pereira de Carvalho  |  Elaboração dos módulos básicos do jogo, como: Escolha de letra, verificação de caracter, GameOver, e loop geral da aplicação | Excelente |
| Charles Manrique Serafim Morais  |  PREENCHER | PREENCHER |
| Ian da Costa Gama  |  PREENCHER | PREENCHER |
| Marcos Diego da Silva Gomes  |  PREENCHER | PREENCHER |
| Matheus Raphael Soares de Oliveira  |  PREENCHER | PREENCHER |
| Pedro Helias Carlos  |  PREENCHER | Excelente |
| Sebastián Héctor Zuzunaga Rosado  |  Desenvolvimento de módulos: Menu principal, fim de jogo, parabéns e erros | Boa |
| Thiago Cerqueira Borges  |  PREENCHER | PREENCHER |


## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
### Eduardo Gurgel
- (i) Lições Aprendidas;
Aprendi os principais conceitos de Haskell, tipagem, código modularizado
- (ii) Percepções;
 A implementação do jogo exigiu o gerenciamento do estado do jogo, como a palavra secreta, a exibição atual da palavra, o número de erros e o status do jogo (venceu/perdeu).
- (iii) Contribuições e Fragilidades
Uso de recursos mais avançados, falta de interface gráfica mais elaborada, curva de aprendizado alta para iniciantes.
- (iV) Trabalhos Futuros.
Aprimorar a Interface do Usuário, otimizar o desempenho, elaborar melhor os níveis de dificuldade.

## Fontes
- Site oficial da Haskell: https://www.haskell.org/haskellwiki/Haskell
- Documentação da linguagem Haskell: https://www.haskell.org/documentation/
- Livro "Learn You a Haskell for Great Good": https://learnyouahaskell.github.io/
- Repositório de reimplementações do jogo da forca em Haskell: https://github.com/haskell
- [Hangman game](https://hackage.haskell.org/package/PlayHangmanGame)

