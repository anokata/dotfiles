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


