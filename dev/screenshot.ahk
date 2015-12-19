;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Printscreen::
Shoot:
{
Gui,Destroy
Process,Close,SnippingTool.exe
FileDelete, %A_ScriptDir%\Capture.png

Run,%ComSpec% /C snippingtool,%A_ScriptDir%,Hide
Done = 1
return
}
return


~LButton UP::
~RButton UP::
IF (Done = 1)
{
IFWinExist, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
    WinActivate
Sleep, 200
Send, {Ctrl Down} {S} {Ctrl Up}
Sleep, 400
Send, {Enter}
Sleep, 500
Done = 0
Gosub, ShowGUI
return
}
return

ShowGUI:
Gui, +AlwaysOnTop
Gui, Add, Picture,, %A_ScriptDir%\Capture.png
Gui, Add, Button,Gnew, Take New Picture
Gui, Add, Button,GIma, Use As ImageSearch
Gui, Show,,AutoSnippShoot
return

Ima:
Code =
(
; Generated by AutoSnippShoot
#SingleInstance force
CoordMode, Pixel, Screen

X:: ; Press X key to search for the image.
ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenHeight%, %A_ScreenWidth%, %A_ScriptDir%\Capture.png
IF ErrorLevel = 0
{
Msgbox, The Image Was Found
Click, %FoundX%, %FoundY% Left, 1
}
IF ErrorLevel = 1
{
Msgbox, Image Not Found!
}
)
Clipboard =
Clipboard = %Code%
ClipWait,2
sleep, 300
TrayTip,AutoSnippShoot, The Code Is Now In Your Clipboard!,5
return

new:
Gosub, Shoot
return

Esc::
ExitApp
return

GuiClose:
ExitApp
return

ExitSub:
{
Process,Close,SnippingTool.exe
FileDelete, %A_ScriptDir%\Capture.png
}
ExitApp