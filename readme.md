# autoHotKeys-scripts

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