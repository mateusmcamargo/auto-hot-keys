# autoHotKeys-scripts

## float_windows.ahk

Script que adiciona atalhos para manipulação de janelas.
- RShift + C -> centraliza a janela com um limite de tamanho em altura;
- RShift + B -> centraliza a janela, com a mesma altura do modo 'tela cheia' e 2/3 da largura da tela
- RShift + F -> deixa a janela em um modo 'tela cheia', mas com uma pequena borda;

>**NOTA:** O script entende que a barra de tarefas está visível e leva em consideração seu tamanho. Basicamente, ele desconsidera a barra de tarefas como parte da tela na hora de calcular as medidas
>
>A barra de tarefas no Windows 11 tem como padrão 40px de altura. No script, ela está configurada como 50px, já que ele foi escrito em um computador com a escala de resolução em 125% *(Configurações > Sistema > Tela > Escala e layout)*
>
>Para ignorar a barra de tarefas, basta mudar o valor de **taskbarHeight** para 0 e alterar o valor de **buffer**, já que essa variável por padrão depende da primeira.

>**ex:**

>- *original:*
>```
>;get taskbar size
>global taskbarHeight := 50
>
>;buffer to add a little margin
>global buffer        := taskbarHeight / 2
>
>;change the position to compensate buffer
>global padd          := buffer / 2
>```
>
>- *modificado:*
>```
>;get taskbar size
>global taskbarHeight := 0
>
>;buffer to add a little margin
>global buffer        := 20
>
>;change the position to compensate buffer
>global padd          := buffer / 2
>```


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