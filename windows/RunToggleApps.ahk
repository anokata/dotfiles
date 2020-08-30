#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Sound
$^!]::Send {Volume_Up 3}
$^![::Send {Volume_Down 3} 

;Timer
;#Persistent
$^#F12::
InputBox, UserInput, Timer, Minutes, 20, 20
minutes:=UserInput
UserInput:=UserInput * -60000
SetTimer, Alert1, %UserInput%
return
Alert1:
SoundBeep, 650, 200 
MsgBox, "%minutes%" min pass
SetTimer, Alert1, Off
return


; win+t totalcmd
#t::
class:="TTOTAL_CMD"
;app:="D:\progs\totalcmd\TOTALCMD.EXE"
app:="D:\progs\TCMI\TOTALCMD64.EXE"
IfWinNotExist, ahk_class %class%
{
	Run %app%
        return
}
IfWinExist, ahk_class %class%
{   
    WinGetTitle, T, ahk_class %class%
    IfWinNotActive, ahk_class %class%
	{
	;WinActivate ahk_class %class%
	WinMinimizeAll
	WinRestore
	WinMaximize
	return
	}
IfWinActive 
{
	WinMinimize
	return
}
}

; win+g telegram
#g::
exe:="Telegram.exe"
app:="D:\progs\TelegramDesktop\Telegram.exe"
IfWinNotExist, ahk_exe %exe%
{
	Run %app%
        return
}
IfWinExist, ahk_exe %exe%
{   
    WinGetTitle, T, ahk_exe %exe%
    IfWinNotActive, ahk_exe %exe%
	{
	WinMinimizeAll
	WinRestore
	WinMaximize
	return
	}
IfWinActive 
{
	WinMinimize
	return
}
}

; win+f firefox
#f::
exe:="firefox.exe"
app:="D:\programs\firefox.exe"
IfWinNotExist, ahk_exe %exe%
{
	Run %app%
        return
}
IfWinExist, ahk_exe %exe%
{   
    WinGetTitle, T, ahk_exe %exe%
    IfWinNotActive, ahk_exe %exe%
	{
	WinMinimizeAll
	WinRestore
	WinMaximize
	return
	}
IfWinActive 
{
	WinMinimize
	return
}
}

; win+e firefox
#e::
exe:="Photoshop.exe"
app:="D:\progs\Photoshop20\Adobe Photoshop 2020\Photoshop.exe"
IfWinNotExist, ahk_exe %exe%
{
	Run %app%
        return
}
IfWinExist, ahk_exe %exe%
{   
    WinGetTitle, T, ahk_exe %exe%
    IfWinNotActive, ahk_exe %exe%
	{
	WinMinimizeAll
	WinRestore
	WinMaximize
	return
	}
IfWinActive 
{
	WinMinimize
	return
}
}


; win+v VIM
#v::
exe:=" gvim.exe"
app:="D:\progs\Vim\vim82\gvim.exe"
IfWinNotExist, ahk_exe %exe%
{
	Run %app%, D:\doc
        return
}
IfWinExist, ahk_exe %exe%
{   
    WinGetTitle, T, ahk_exe %exe%
    IfWinNotActive, ahk_exe %exe%
	{
	WinMinimizeAll
	WinRestore
	WinMaximize
	return
	}
IfWinActive 
{
	WinMinimize
	return
}
}

