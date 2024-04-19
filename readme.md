# autoHotKeys-scripts

## 🪟 float_windows.ahk

Script que adiciona atalhos para manipulação de janelas.
- RShift + C -> centraliza a janela com um limite de tamanho em altura;
- RShift + B -> centraliza a janela, com a mesma altura do modo 'tela cheia' e 2/3 da largura da tela
- RShift + F -> deixa a janela em um modo 'tela cheia', mas com uma pequena borda;


>**NOTA:** O script entende se a barra de tarefas está visível e leva em consideração seu tamanho. Basicamente, ele desconsidera a barra de tarefas como parte da tela na hora de calcular as medidas caso ela esteja visível
>
>O script obtém automaticamente o tamanho da barra de tarefas, que no Windows 11 tem como padrão 40 pixels de altura.
>
>Se mesmo assim queira verificar a altura da barra de tarefas manualmente, basta ir em: *(Configurações > Sistema > Tela > Escala e layout)* e multiplicar a altura padrão pela escala de resolução do computador.
>Exemplo: se a escala for 125%, basta fazer **40 * 1,5**, que terá o resultado de 50 pixels.
>

**exemplo de alteração para "ignorar" a barra de tarefas:**

*original:*
```
;get taskbar size
global taskbarHeight := 50

;buffer to add a little margin
global buffer        := taskbarHeight / 2

;change the position to compensate buffer
global padd          := buffer / 2
```

*modificado:*
```
;get taskbar size
global taskbarHeight := 0

;buffer to add a little margin
global buffer        := 20

;change the position to compensate buffer
global padd          := buffer / 2
```
>Vale lembrar que todos os valores podem ser alterados e customizados, desde as teclas utilizadas nos atalhos até variáveis que compõem as funções.


## ⚙️ taskbar.ahk

Script que manipula a barra de tarefas
- RShift + ; -> liga/desliga (esconde/mostra) a barra de tarefas;


## inicialização automática dos scripts

1. **Adicionar Atalho à Pasta de Inicialização**:
   - O Windows possui uma pasta especial chamada **Inicialização**, onde você pode adicionar atalhos de aplicativos que deseja iniciar com o sistema.
   - Siga estas etapas:
     1. Primeiro, crie um atalho para o seu script AutoHotkey.
     2. Localize o script AutoHotkey que você deseja adicionar à inicialização.
     3. Selecione o script, mantenha pressionada a tecla **Alt** e arraste-o para a mesma pasta/diretório.
     4. Isso criará instantaneamente um atalho do script.
     5. Se desejar, remova o sufixo ".ahk - atalho" do nome do atalho.
     6. Pressione **Win + R** para abrir a caixa de diálogo Executar.
     7. Digite o comando `shell:startup` e clique em "OK".
     8. Isso abrirá a pasta de inicialização. Cole o atalho copiado (pressione **Ctrl + V**).
     9. A partir de agora, o script AutoHotkey será iniciado automaticamente com o Windows.

2. **Criar uma Tarefa Agendada**:
   - Se você deseja usar o Agendador de Tarefas para iniciar seus aplicativos, pode fazer o mesmo com o script AutoHotkey.
   - Isso é especialmente útil se você deseja atrasar o início do programa.
   1. Abra o menu Iniciar, pesquise "Agendador de Tarefas" e clique no resultado para abrir o Agendador de Tarefas.
   2. Crie uma nova tarefa agendada e configure-a para executar o seu script AutoHotkey na inicialização do Windows.