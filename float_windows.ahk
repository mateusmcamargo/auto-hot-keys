; Script para centralizar uma janela no Windows usando AutoHotKey
global windowName
global X
global Y
global begWidth
global begHeight

; Quando a tecla RShift + c for pressionada:
RShift & c::
    ; Obtém o título da janela ativa
    WinGetTitle, windowName, A
    ; Obtém a posição e tamanho da janela
    WinGetPos, X, Y, begWidth, begHeight, %windowName%
    ; Chama a função para centralizar a janela
    floatCenter(windowName)
return

; Quando a tecla RShift + f for pressionada:
RShift & f::
    ; Obtém o título da janela ativa
    WinGetTitle, windowName, A
    ; Obtém a posição e tamanho da janela
    WinGetPos, X, Y, begWidth, begHeight, %windowName%
    ; Chama a função para centralizar a janela
    floatFull(windowName)
return

; Quando a tecla RShift + b for pressionada:
RShift & b::
    ; Move a janela de volta para a posição original
    WinMove, %windowName%,, X, Y, begWidth, begHeight
return

; Função para centralizar a janela
floatCenter(windowName) {
    ; Calcula a posição central da tela
    ScreenWidth := A_ScreenWidth
    ScreenHeight := A_ScreenHeight
    TaskbarHeight := 40
    Buffer := 20
    Padd   := 10
    VSCodeCutH := 20
    VSCodeCutW := 16

    if (windowName = "centralize_windows.ahk - Visual Studio Code") {
        begHeight := ScreenHeight - TaskbarHeight - Buffer - VSCodeCutH
        begWidth  := (ScreenWidth  / 1.5) - VSCodeCutW

        NewX := (ScreenWidth - begWidth) // 2
        NewY := ((ScreenHeight - begHeight) // 2) - TaskbarHeight + (Buffer / 2)

        ; Exibe o título da janela
        ; MsgBox, DEU CERTO O título da janela ativa é: %windowName%
    } else {
        begHeight := ScreenHeight - TaskbarHeight - Buffer - Padd
        begWidth  := ScreenWidth  / 1.5

        NewX := (ScreenWidth - begWidth) // 2
        NewY := ((ScreenHeight - begHeight) // 2) - TaskbarHeight + (Buffer / 2) + (Padd / 2)
    }
    
    ; Move a janela para a posição central
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

; Função para centralizar a janela em 'tela cheia'
floatFull(windowName) {
    ; Calcula a posição central da tela
    ScreenWidth   := A_ScreenWidth
    ScreenHeight  := A_ScreenHeight
    TaskbarHeight := 40
    Buffer        := 20
    Padd          := 10
    VSCodeCutH    := 16
    VSCodeCutW    := 16

    if (windowName = "centralize_windows.ahk - Visual Studio Code") {
        begHeight := ScreenHeight - Buffer - VSCodeCutH - TaskbarHeight 
        begWidth  := ScreenWidth  - (Buffer / 2) -   VSCodeCutW

        NewX := (ScreenWidth - begWidth) // 2
        NewY := ((ScreenHeight - begHeight) // 2) - TaskbarHeight + (Buffer / 2)
    } else {
        begHeight := ScreenHeight - Buffer - Padd - TaskbarHeight
        begWidth  := ScreenWidth  - (Buffer / 2)

        NewX := (ScreenWidth - begWidth) // 2
        NewY := ((ScreenHeight - begHeight) // 2) - TaskbarHeight + (Buffer / 2) + (Padd / 2)
    }
    
    ; Move a janela para a posição central
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}
