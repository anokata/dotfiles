#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
 #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; ^ctrl #win +shift !alt



; CLIP STUDIO PAINT
#IfWinActive, ahk_exe CLIPStudioPaint.exe
;$Esc::Send {/}
$CapsLock::Send {/}
$^Space::Send {\}

$Tab::Send {Enter}
;$LWin::Send {Delete}


#IfWinActive

#IfWinActive, ahk_class Photoshop
; Free keys: h y i k - = [ ] F10 F11

; TODO FULLSCREEN TO TAB+SHIFT
; fullscreen
;$+v::Send ^+f 
;$+{Tab}::Send ^+f 

$Tab::Send {Enter}
;$LWin::Send {Delete}

; shift-s = polylasso
$+s::Send m

; Actions windows Num- ->alt-F9
$NumpadSub::Send !{F9}
; NumpadDot NumpadMult NumpadAdd NumpadEnter

; Lock layer shift-ctrl-a -> shift-f3
$+^a::Send +{F3}

;Layer via Copy ctrl-alt-c -> ctrl-shift-f11
$^!c::Send ^+{F11}

; fill with fg alt+x -> alt+bs
$!x::Send !{Backspace}
; fill with bg alt+c -> ctrl+bs
$!c::Send ^{Backspace}

; Mirror copy layer  -> ctrl-shift-f9
$^!m::Send ^+{F9}

$^Esc::Send {Enter}

; Layer via cut ctrl-shift-f4  -> ctrl-alt-x
$^!x::Send ^+{F4}

; New Back Layer D -> ctrl-f10
$+d::Send ^{F10}

; transform t->ctrl-t
; text ctrl-t -> t
$t::Send ^t
$^t::Send t

; Gradient map M -> ctrl-shift-f6
$+m::Send ^+{F6}

; hide layer and add new !buging  ctrl+. -> ctrl-shift-f5
$^.::Send ^+{F5}
; add layer mask ctrl-alt-w to ctrl-shift-f12
$^!w::Send ^+{F12}
$^a::Send ^+{F12}
; liquify
$+w::Send ^+x
;New Layer ;  Новый слой
$d::Send ^+{F2}
;$n::Send ^!+n
;$^n::Send ^n
; Merge Layers ;layers-merge-down v
$v::Send ^e
; zoom 100%
$1::Send ^1
; zoom +
$3::SendInput, {ctrl down}={ctrl up}
; zoom -
$2::Send ^-
; zoom fit to screen
$4::Send ^0
; color dialog
$c::Send +!{F6}
; select-none `
$`::Send ^!{F12}
; диалог слоев
$a::Send ^!+{F7}
; жесткая кисть 
$F1::Send +{F2}
; размер кисти qw
$q::Send [
$w::Send ]
;связать слой с пред <Primary><Shift>z -> ctrl-alt-g
$+Z::Send ^!g
; Добавить связанный слой
$g::Send ^+{F10}
; выбор кисти caps 
$CapsLock::Send ^+!{F6}
; Пресеты <ctrl> space
$^Space::Send ^+!{F12}
; Установить режим слоя: норм, screen, softlight, add
$Numpad1::Send ^+{F8}
$Numpad2::Send ^+{F7}
$Numpad3::Send +{F6}
$Numpad4::Send +{F7}
$Numpad0::Send +{F8}
$Numpad5::Send +{F9}
$Numpad6::Send +{F10}
$Numpad7::Send ^{F7}
$Numpad8::Send ^{F6}
; colors-default <ctrl>`  maybe n?
$^`::Send k
; vectors-selection-replace <Shift>g
#$+G::Send +{F11}
; vectors-selection-to-vectors g
#$j::Send +{F12}
; ctrl-alt-f9 define brush
$+^!n::Send +^!n

;в серое <Shift>F9
;tools-clone
;tools-ink <Shift>k
;tools-measure <Shift>n
;выделить по альфе
;filters-kaleidoscope <Primary><Alt>k
;filters-mosaic <Primary><Alt>m
;image-resize F2
;select-border F3
;select-feather <Primary><Alt>z
;select-shrink <Alt>F2

#IfWinActive


SetDefaultKeyboard(LocaleID){
	Static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
	
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(binaryLocaleID, 4, 0)
	NumPut(LocaleID, binaryLocaleID)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
	
	WinGet, windows, List
	Loop % windows {
		PostMessage 0x50, 0, % Lan, , % "ahk_id " windows%A_Index%
	}
}

#IfWinActive, ahk_exe gvim.exe
;RUS := 0x0419
$CapsLock::
Send {Esc}
USA := 0x0409
;SetDefaultKeyboard(USA)
Return	

#IfWinActive
$CapsLock::Send {Esc}
$#CapsLock::Send {Esc}
$!CapsLock::Send {Esc}

#$^r::Reload

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

; Interval Timer
$^#F11::
Gui, Destroy
Gui, Add, Text,, Interval:
Gui, Add, Edit
Gui, Add, UpDown, vInterval Range1-100, 1 ym  
Gui, Add, CheckBox, vSeconds, Seconds?
Gui, Add, Text,, Count:
Gui, Add, Edit
Gui, Add, UpDown, vCount Range1-100, 5
Gui, Add, Button, default, OK
Gui, Show,, Simple Input Example
return  

ButtonOK:
Gui, Submit 
if (Seconds == 0) 
{
Interval:=Interval * 60000
}
if (Seconds == 1) 
{
Interval:=Interval * 1000
}

; start timer
;MsgBox "%Interval% by %Count% %Seconds%".
SetTimer, AlertI, %Interval%
return

; timer action
AlertI:
SoundBeep, 650, 200 
Count:=Count - 1
if (Count <= 0) {
	SetTimer, AlertI, Off
	SoundBeep, 350, 200 
}

return

GuiClose:
Gui, Submit  
return



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

; win+e ps
#e::
exe:="Photoshop.exe"
app:="D:\progs\Photoshop20\Adobe Photoshop 2020\Photoshop.exe"
IfWinNotExist, ahk_exe %exe%
{
	;Run %app%
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

; far
; win+a far
#a::
exe:="Far.exe"
app:="D:\progs\Far\Far.exe"
IfWinNotExist, ahk_exe %exe%
{
	Run %app%
	Sleep 1	
	WinMaximize
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

; win+c git-bash
#c::
exe:="Far.exe"
app:="D:\progs\Git\git-bash.exe"
IfWinNotExist, ahk_exe %exe%
{
	Run %app%
	Sleep 1	
	WinMaximize
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


; win+s screen saver
#s::
{
Run C:/Windows/System32/scrnsave.scr /s
}


setKeyDelay, 50, 50
setMouseDelay, 50
$#^~lbutton::
	while (getKeyState("lbutton", "P"))
	{
		send, {lbutton}
		sleep, 50
	}
return
