;center windows in different shapes and positions

;global variables
global windowName
global X
global Y
global begWidth
global begHeight
/*
;pressing RShift + c -> floatCenter()
RShift & c::
    ;get active window title
    WinGetTitle, windowName, A
    ;get active window position and size
    WinGetPos, X, Y, begWidth, begHeight, %windowName%
    ;call the function
    floatCenter(windowName)
return
*/
;pressing RShift + b -> floatCenterBig()
RShift & b::
    ;get active window title
    WinGetTitle, windowName, A
    ;get active window position and size
    WinGetPos, X, Y, begWidth, begHeight, %windowName%
    ;call the function
    floatCenterBig(windowName)
return

;pressing RShift + f -> floatCenterFull()
RShift & f::
    ;get active window title
    WinGetTitle, windowName, A
    ;get active window position and size
    WinGetPos, X, Y, begWidth, begHeight, %windowName%
    ;call the function
    floatCenterFull(windowName)
return

floatCenterBig(windowName) {
    ;get screen size
    ScreenWidth   := A_ScreenWidth
    ScreenHeight  := A_ScreenHeight

    ;get taskbar size
    TaskbarHeight := 40

    ;buffer to add a little margin
    Buffer        := 20

    ;change the position to compensate buffer
    Padd          := Buffer / 2

    ;custom sizes for specific windows (more can be added on the switch statement)
    VSCodeCutH    := 16
    VSCodeCutW    := 16

    ;checks for specific windows. 
    ;eg: the first case is VSCode, as it is a bit bigger than the others
    ;more windowName cases can be added
    ;msgBox can be used to get windowName
    ;a switch statement could be used, but some windows change name constantly, so an if statement works best
    if (InStr(windowName, "Visual Studio Code")) {
        ;compensate for the difference in size and set new size
        begHeight := ScreenHeight - TaskbarHeight - Buffer - VSCodeCutH
        begWidth  := (ScreenWidth  / 1.5) - VSCodeCutW

        ;set new position
        NewX := (ScreenWidth - begWidth) // 2
        NewY := ((ScreenHeight - begHeight) // 2) - TaskbarHeight + (Buffer / 2)

        ;debug
        MsgBox, VSCode: o título da janela ativa é: %windowName%
    } else {
        ;now for any windowName, set new size
        begHeight := ScreenHeight - TaskbarHeight - Buffer - Padd
        begWidth  := ScreenWidth  / 1.5

        NewX := (ScreenWidth - begWidth) // 2
        NewY := ((ScreenHeight - begHeight) // 2) - TaskbarHeight + (Buffer / 2) + (Padd / 2)

        ;debug
        MsgBox, ANY: o título da janela ativa é: %windowName%
    }
    */

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

; Função para centralizar a janela em 'tela cheia'
floatCenterFull(windowName) {
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

/*
floatCenter() //center
floatCenterFull() //center fullscreen
floatCenterBig //center big
floatLeft() //center left side
floatRight() //center right side
*/