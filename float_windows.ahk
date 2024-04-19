;center windows in different shapes and positions

;global variables
global windowName
global X
global Y
global begWidth
global begHeight

;pressing RShift + c -> floatCenter()
RShift & c::
    ;get active window title
    WinGetTitle, windowName, A
    ;get active window position and size
    WinGetPos, X, Y, begWidth, begHeight, %windowName%
    ;call the function
    floatCenter(windowName)
return

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

floatCenter(windowName) {
    ;get screen size
    ScreenWidth   := A_ScreenWidth
    ScreenHeight  := A_ScreenHeight

    ;get taskbar size
    TaskbarHeight := 40

    ;buffer to add a little margin
    Buffer        := 20

    ;change the position to compensate buffer
    Padd          := Buffer / 2

    ;limit height
    maxHeight := ScreenHeight - TaskbarHeight - Buffer - Padd
    if (begHeight >= maxHeight) {
        begHeight := maxHeight
    }

    ;get new position
    NewX := (ScreenWidth  - begWidth)  / 2
    NewY := ((ScreenHeight - begHeight) / 2) - TaskbarHeight + (Buffer / 2)

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

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

    ;custom sizes for specific windows (more can be added in the if statement)
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

        ;get new position
        NewX := (ScreenWidth - begWidth) / 2
        NewY := ((ScreenHeight - begHeight) / 2) - TaskbarHeight + (Buffer / 2)

        ;debug
        ;MsgBox, VSCode: o título da janela ativa é: %windowName%
    } else {
        ;now for any windowName, set new size
        begHeight := ScreenHeight - TaskbarHeight - Buffer - Padd
        begWidth  := ScreenWidth  / 1.5

        ;get new position
        NewX := (ScreenWidth - begWidth) / 2
        NewY := ((ScreenHeight - begHeight) / 2) - TaskbarHeight + (Buffer / 2) + (Padd / 2)

        ;debug
        ;MsgBox, ANY: o título da janela ativa é: %windowName%
    }

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

floatCenterFull(windowName) {
    ;get screen size
    ScreenWidth   := A_ScreenWidth
    ScreenHeight  := A_ScreenHeight

    ;get taskbar size
    TaskbarHeight := 40

    ;buffer to add a little margin
    Buffer        := 20

    ;change the position to compensate buffer
    Padd          := Buffer / 2

    ;custom sizes for specific windows (more can be added in the if statement)
    VSCodeCutH    := 16
    VSCodeCutW    := 16

    ;checks for specific windows. 
    ;eg: the first case is VSCode, as it is a bit bigger than the others
    ;more windowName cases can be added
    ;msgBox can be used to get windowName
    ;a switch statement could be used, but some windows change name constantly, so an if statement works best
    if (InStr(windowName, "Visual Studio Code")) {
        ;compensate for the difference in size and set new size
        begHeight := ScreenHeight - Buffer - VSCodeCutH - TaskbarHeight 
        begWidth  := ScreenWidth  - (Buffer / 2) -   VSCodeCutW

        ;get new position
        NewX := (ScreenWidth - begWidth) / 2
        NewY := ((ScreenHeight - begHeight) / 2) - TaskbarHeight + (Buffer / 2)

        ;debug
        ;MsgBox, VSCode: o título da janela ativa é: %windowName%
    } else {
        ;now for any windowName, set new size
        begHeight := ScreenHeight - Buffer - Padd - TaskbarHeight
        begWidth  := ScreenWidth  - (Buffer / 2)

        ;get new position
        NewX := (ScreenWidth - begWidth) / 2
        NewY := ((ScreenHeight - begHeight) / 2) - TaskbarHeight + (Buffer / 2) + (Padd / 2)

        ;debug
        ;MsgBox, ANY: o título da janela ativa é: %windowName%
    }

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

/*
floatCenter() //center
✔ floatCenterFull() //center fullscreen
✔ floatCenterBig //center big
floatLeft() //center left side
floatRight() //center right side
*/

/*
fix values - ANY
fix value - VScode
*/