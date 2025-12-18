# Execução de um jogo Linux no Windows através de WSL

## Conceito do projeto

Este projeto tem como objetivo viabilizar a execução de um jogo nativo de Linux em ambiente Windows, utilizando o Windows Subsystem for Linux 2 (WSL2), com foco na criação de Tool-Assisted Speedruns (TAS). Para isso, foi explorado o uso da ferramenta LibTAS, amplamente empregada na comunidade de speedrunning em sistemas Linux, permitindo controle preciso de entradas, execução determinística e análise quadro a quadro do jogo.

O jogo escolhido para os experimentos foi Hollow Knight (versão Linux), por se tratar de um jogo 2D relativamente leve, popular na comunidade de speedruns e amplamente documentado. O projeto investiga a compatibilidade gráfica e o desempenho da execução do jogo dentro do WSL2 no Windows 11, avaliando limitações, erros gráficos e estabilidade, bem como as possibilidades futuras para estudos envolvendo virtualização e execução cruzada de aplicações gráficas.

---

## Pré-requisitos e recursos utilizados

O projeto utilizou os seguintes recursos e tecnologias:

- Sistema Operacional: Windows 11  
- Windows Subsystem for Linux 2 (WSL2)  
- Distribuição Linux: Ubuntu (executada dentro do WSL2)  
- Jogo: Hollow Knight (versão nativa para Linux)  
- Ferramenta de TAS: LibTAS  

Como material de apoio, foi utilizado o tutorial oficial do LibTAS disponível em:  
https://clementgallet.github.io/libTAS/guides/wsl  

O LibTAS foi obtido a partir do repositório oficial de releases:  
https://github.com/clementgallet/libTAS/releases/tag/v1.4.7  

---

## Passo a passo

1. Instalação do WSL2 no Windows 11 por meio do PowerShell utilizando o comando: wsl --install
2. Instalação de uma distribuição Linux (Ubuntu) dentro do WSL2.
3. Download da versão Linux do jogo Hollow Knight e cópia dos arquivos para o sistema de arquivos do WSL.
4. Download e instalação do LibTAS utilizando o pacote `.deb` correspondente à arquitetura do sistema: sudo dpkg -i ./libtas_*_amd64.deb
5. Execução do LibTAS diretamente pelo terminal Ubuntu com o comando: libTAS
6. Tentativa inicial de execução do jogo via script `start.sh`, resultando em erro relacionado ao OpenGL.
7. Identificação do problema na variável de ambiente `$DISPLAY`.
8. Correção do erro gráfico ajustando a variável: export DISPLAY=:0
(ou adicionando essa linha ao arquivo `.bashrc` para tornar a configuração permanente).
9. Execução do jogo forçando o uso do OpenGL colocando a flag -force-opengl no arquivo start.sh. Ou se for uma execução direta ./HollowKnight -force-opengl na pasta onde está o executável (transformado em executável geralmente através do comando no Ubuntu chmod +x HollowKnight).

10. Testes de execução e observação de falhas gráficas e encerramento prematuro do jogo após aproximadamente 10 minutos.

---

## Instalação

1. Abra o PowerShell no Windows 11.
2. Execute o comando: wsl --install
3. Reinicie o sistema, se necessário.
4. Abra o terminal Ubuntu (WSL).
5. Instale o LibTAS com: sudo dpkg -i ./libtas_*_amd64.deb
6. Copie os arquivos do jogo Hollow Knight (versão Linux) para o sistema de arquivos do WSL (por praticidade).

---

## Execução

1. No terminal Ubuntu (WSL), configure a variável de ambiente: export DISPLAY=:0
2. Execute o LibTAS com: libTAS
3. Execução do jogo forçando o uso do OpenGL colocando a flag -force-opengl no arquivo start.sh. Ou se for uma execução direta ./HollowKnight -force-opengl na pasta onde está o executável (transformado em executável geralmente através do comando no Ubuntu chmod +x HollowKnight).

5. Observe o comportamento do jogo durante a execução.

---

## Bugs/problemas conhecidos

- O jogo encerra de forma inesperada após cerca de 10 minutos de execução.
- Ocorrência de distorções visuais nos shaders, afetando a estética do jogo.
- Possíveis incompatibilidades na conversão gráfica entre Linux e Windows via WSL2.
- Problemas iniciais de exibição gráfica causados por configuração incorreta da variável `$DISPLAY`.

---

## Autores

- Rick Robert

---

## Demais anotações e referências

Este trabalho abre possibilidades para estudos futuros relacionados à execução de jogos nativos de outros sistemas operacionais, uso de máquinas virtuais e subsistemas, bem como aplicações que demandam maior processamento gráfico em ambientes virtualizados.

---

## Imagens/screenshots

É necessário adicionar pelo menos 3 imagens ou screenshots do projeto. As imagens devem, preferencialmente, estar hospedadas no próprio repositório do GitHub.

Exemplo de inserção de imagem no README:

![Imagem](https://github.com/Rick-Robert/JogoLinuxEmWindows/main/exemplo.png)

