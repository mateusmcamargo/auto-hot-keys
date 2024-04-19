;center windows in different shapes and positions

;global variables
global windowName
global X
global Y
global begWidth
global begHeight

;get screen size
global screenWidth   := A_screenWidth
global screenHeight  := A_screenHeight

;get taskbar size
global taskbarHeight := 50

;buffer to add a little margin
global buffer        := taskbarHeight / 2

;change the position to compensate buffer
global padd          := buffer / 2

;custom sizes for specific windows
;(more can be added here and in the if statement, maybe a for loop can be used as well)
global vsCodeCutH    := 8
global vsCodeCutW    := 16

/* CENTER
        ;now for any windowName, set new size
        begHeight := screenHeight - taskbarHeight
        begWidth  := screenWidth  / 1.5

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer
*/

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
    ;checks for specific windows. 
    ;eg: the first case is VSCode, as it is a bit bigger than the others
    ;more windowName cases can be added
    ;msgBox can be used to get windowName
    ;a switch statement could be used, but some windows change name constantly, so an if statement works best
    if (InStr(windowName, "Visual Studio Code")) {
        ;limit height
        maxHeight := screenHeight - (taskbarHeight * 4) - vsCodeCutH
        if (begHeight >= maxHeight) {
            begHeight := maxHeight
        }

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer - (vsCodeCutH / 2)

        ;debug
        ;MsgBox, VSCode: o título da janela ativa é: %windowName%
    } else {
        ;limit height
        maxHeight := screenHeight - (taskbarHeight * 4)
        if (begHeight >= maxHeight) {
            begHeight := maxHeight
        }

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer

        ;debug
        ;MsgBox, ANY: o título da janela ativa é: %windowName%
    }

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

floatCenterBig(windowName) {
    ;checks for specific windows. 
    ;eg: the first case is VSCode, as it is a bit bigger than the others
    ;more windowName cases can be added
    ;msgBox can be used to get windowName
    ;a switch statement could be used, but some windows change name constantly, so an if statement works best
    if (InStr(windowName, "Visual Studio Code")) {
        ;compensate for the difference in size and set new size
        begHeight := (screenHeight - taskbarHeight) - buffer - vsCodeCutH
        begWidth  := (screenWidth  / 1.5          )          - vsCodeCutW

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer - (vsCodeCutH / 2)

        ;debug
        ;MsgBox, VSCode: o título da janela ativa é: %windowName%
    } else {
        ;now for any windowName, set new size
        begHeight := (screenHeight - taskbarHeight) - buffer
        begWidth  := screenWidth  / 1.5

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer

        ;debug
        ;MsgBox, ANY: o título da janela ativa é: %windowName%
    }

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

floatCenterFull(windowName) {
    ;screen center
    centerX := (screenWidth  - begWidth ) / 2
    centerY := (screenHeight - begHeight) / 2

    ;checks for specific windows. 
    ;eg: the first case is VSCode, as it is a bit bigger than the others
    ;more windowName cases can be added
    ;msgBox can be used to get windowName
    ;a switch statement could be used, but some windows change name constantly, so an if statement works best
    if (InStr(windowName, "Visual Studio Code")) {
        ;compensate for the difference in size and set new size
        begHeight := (screenHeight - taskbarHeight) - buffer - vsCodeCutH
        begWidth  :=  screenWidth                   - padd   - vsCodeCutW

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer - (vsCodeCutH / 2)
        ;debug
        ;MsgBox, VSCode: o título da janela ativa é: %windowName%
    } else {
        ;now for any windowName, set new size
        begHeight := (screenHeight - taskbarHeight) - buffer
        begWidth  :=  screenWidth                   - padd

        ;screen center
        centerX := (screenWidth  - begWidth ) / 2
        centerY := (screenHeight - begHeight) / 2

        ;get new position
        NewX := centerX
        NewY := centerY - taskbarHeight + buffer

        ;debug
        ;MsgBox, ANY: o título da janela ativa é: %windowName%
    }

    ;move active window to the new position
    WinMove, %windowName%,, NewX, NewY, begWidth, begHeight
}

/*
☑ floatCenter() //center
☑ floatCenterFull() //center fullscreen
☑ floatCenterBig //center big
☐ floatLeft() //center left side
☐ floatRight() //center right side
*/

/*
☑ fix values - ANY
☑ fix value - VScode
*/

/*
☐ add to windows startup
☐ auto center when resize
☐ get spotfy size and set as minimum
*/