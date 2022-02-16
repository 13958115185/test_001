#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#WinActivateForce

$F10::
    SoundBeep, 2500
    WinGet, id , List, ahk_exe onmyoji.exe ;获取onmyoji的唯一 ID 号
    Loop
    {
        ;遍历阴阳师窗口
        Loop, %id%
        {
            this_id := id%A_Index% 
            WinGetTitle, name, ahk_id %this_id%  ;获取窗口标题
            IfNotEqual, name, 阴阳师-网易游戏, Continue ;判断是否为多余窗口
            WinActivate, ahk_id %this_id% ;激活窗口
            WinMove, ahk_id %this_id%, , , , 1138, 672 ;改变窗口大小
            
            ;点击判断
            ImageSearch, VarX, VarY, 0, 0, 1200, 700, *50 img/胜利1.png 
            IfEqual, ErrorLevel, 0, ControlClick, , ahk_id %this_id%, , Left, 1, NA x%VarX% y%VarY%

            ImageSearch, VarX, VarY, 0, 0, 1200, 700, *50 img/胜利2.png
            IfEqual, ErrorLevel, 0, ControlClick, , ahk_id %this_id%, , Left, 1, NA x%VarX% y%VarY%

            ImageSearch, VarX, VarY, 0, 0, 1200, 700, *50 img/失败.png
            IfEqual, ErrorLevel, 0, ControlClick, , ahk_id %this_id%, , Left, 1, NA x%VarX% y%VarY%

            ImageSearch, VarX, VarY, 0, 0, 1200, 700, *50 img/挑战.png
            IfEqual, ErrorLevel, 0, ControlClick, , ahk_id %this_id%, , Left, 1, NA x%VarX% y%VarY%

            ImageSearch, VarX, VarY, 0, 0, 1200, 700, *50 img/接受.png
            IfEqual, ErrorLevel, 0, ControlClick, , ahk_id %this_id%, , Left, 1, NA x%VarX% y%VarY%

            ImageSearch, VarX, VarY, 0, 0, 1200, 700, *50 img/自动接受.png
            IfEqual, ErrorLevel, 0, ControlClick, , ahk_id %this_id%, , Left, 1, NA x%VarX% y%VarY%
            
        }

        ;F10停止
        KeyWait, F10, D, T 0.05
        If (ErrorLevel == 0)
        {
            SoundBeep, 500
            Return
        }
        Random, RandVar , 450, 3000
        Sleep, %RandVar%

    }
Return


$f12:: ExitApp
