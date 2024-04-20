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
[Vídeo de Apresentação - Visual](https://youtu.be/NNxE_Oa3U5w)

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Eduardo Gurgel Pereira de Carvalho  |  Elaboração dos módulos básicos do jogo, como: Escolha de letra, verificação de caracter, GameOver, e loop geral da aplicação | Excelente |
| Charles Manrique Serafim Morais  |  PREENCHER | PREENCHER |
| Ian da Costa Gama  |  PREENCHER | PREENCHER |
| Marcos Diego da Silva Gomes  |  Criação da biblioteca de palavras e elaboração do módulo de manipulação da mesma, incluindo leitura de arquivo, edição dos dados, separação por categorias e manipulação em listas. | Boa |
| Matheus Raphael Soares de Oliveira  |  Elaboração da parte lógica do jogo. Criação do sistema de hints que revela uma letra ao usuário. Colaboração com outros colegas para a finalização do projeto. | Excelente |
| Pedro Helias Carlos  |  Criação da parte lógica do projeto, incluindo: verificação de caracter, escolha de letras, comparação de palavras, conversão da palavra em caractere, funcionamento base do jogo. Além de adaptação do código as regras do jogo (vitória e derrota), e integração entre menu e parte lógica. | Excelente |
| Sebastián Héctor Zuzunaga Rosado  |  Desenvolvimento de módulos: Menu principal, fim de jogo, parabéns e erros | Boa |
| Thiago Cerqueira Borges  |  PREENCHER | PREENCHER |


## Outros 

### Lições Aprendidas
- Principais conceitos de Haskell, tipagem e modularização de código
- Criação e manipulação de arquivos

### Percepções
- O Haskell pode se tornar bem complexo a medida que se aprofunda no conhecimento da linguagem
- A implementação do jogo exigiu o gerenciamento do estado do jogo, como a palavra secreta, a exibição atual da palavra, o número de erros e o status do jogo (venceu/perdeu)
- Trabalhar com IO possui suas complexidades
- Juntar branchs apenas ao final do projeto pode causar dificuldades, existência de retrabalhos e código desperdiçado, além de impedir um melhor refinamento do projeto

### Contribuições
- União do grupo em relação as ideias relacionadas ao projeto
- Divisão de partes do projeto e auxílio em fontes de conhecimento para aprendizagem
- Implementação do jogo e utilização de biblioteca de palavras em arquivo auxiliar

### Fragilidades
- Falta de interface gráfica mais elaborada
- Maior biblioteca de palavras

### Trabalhos Futuros
- Aprimorar a Interface do Usuário
- Elaborar melhor os níveis de dificuldade
- Expansão da biblioteca de palavras
- Implementação de funções para deixar o próprio usuário incluir e remover categorias e palavras da biblioteca

## Fontes
- Site oficial da Haskell: https://www.haskell.org/haskellwiki/Haskell
- Documentação da linguagem Haskell: https://www.haskell.org/documentation/
- Livro "Learn You a Haskell for Great Good": https://learnyouahaskell.github.io/
- Repositório de reimplementações do jogo da forca em Haskell: https://github.com/haskell
- [Hangman game](https://hackage.haskell.org/package/PlayHangmanGame)

