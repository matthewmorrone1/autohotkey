#EscapeChar \  					; Change it to be backslash instead of the default of accent (`).
#InstallKeybdHook  				; this MUST be called at the start of your script
#Persistent
; #NoEnv  						; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  	; Ensures a consistent starting directory.
#SingleInstance, force
#HotkeyInterval 1000 		  	; This is  the default value (milliseconds).
#MaxHotkeysPerInterval 200
#WinActivateForce
SetTitleMatchMode 2 			; A window's title can contain WinTitle anywhere inside it to be a match. 