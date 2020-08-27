﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;^Space::MsgBox % A_ThisHotkey

#IfWinActive, ahk_class Photoshop
;New Layer ;  Новый слой
;d::^+F2
$d::Send ^+{F2}
n::^+n
$^n::Send ^n
; Merge Layers ;layers-merge-down v
$v::Send ^e
; zoom 100%
$1::Send ^1
; zoom +
$3::SendInput, {ctrl down}={ctrl up}
; zoom -
$2::Send ^-

; color dialog
$z::Send +!{F6}
; filters/filters-hue-saturation <Primary><Alt>h
; select-none `
$`::Send ^!{F12}

; мягкая кисть 
$F2::Send ^+{F4}
; жесткая кисть 
$F1::Send ^+{F5}
; размер кисти qw
$q::Send [
$w::Send ]
;Ластик мягкий e
$F3::Send ^+{F12}
;Ластик жесткий
$F4::Send ^+{F11}
;связать слой с пред <Primary><Shift>z
$+Z::Send ^!g
; диалог цвета  z
; Добавить связанный слой
$j::Send ^+{F10}
; выбор кисти <ctrl> space / win
$^Space::Send ^+!{F6}
$LWin::Send ^+!{F6}
; Текст t
; layers-delete Delete
; dialogs-keyboard-shortcuts ctrl+alt+shift+k
; layers-lock-alpha a
; tools-bucket-fill g
; tools-ellipse-select <Shift>e
; tools-free-select s 
; tools-gradient >g
;  диалог кисти ctrl b
;  Диалог слоёв F6
;  Зум
;  размытие o
; Фильтра кривые <Primary>l
; Фильтр порог <Primary><Shift>t
; трансформация ctrl-t
; Зеркал вида <ctrl>f
; flow & opacity : 4 5 6 0 & shift 1 &*)_  flow больше 30 и не надо
; Пресеты Casp
$CapsLock::Send ^+!{F12}
; Установить режим слоя: норм, screen, softlight, 
$Numpad1::Send ^+{F8}
$Numpad2::Send ^+{F7}
$Numpad3::Send +{F6}
$Numpad4::Send +{F7}
$Numpad0::Send +{F8}
$Numpad5::Send +{F9}
; colors-default <ctrl>`
$^`::Send k
;Invers selection ctrl-i

;поворот холста
;Добавить маску
;tools-heal <Shift>h
;tools-ink <Shift>k
;tools-measure <Shift>n
;tools-shear
;tools-size-increase-percent z
;tools-smudge ?
;tools-unified-transform t
;vectors-selection-replace <Shift>g
;vectors-selection-to-vectors g
;view-show-grid <Primary>g
;блюр <Primary><Shift>b
;в серое <Shift>F9
;выделить по альфе
;Документ 1 <Alt>1
;слой по изображению F12
;фильтр контраста <Primary><Alt>t
;Фильтра денасыщенность <Primary><Alt>c
;edit-paste-as-new-layer-in-place <Shift>b
;filters-kaleidoscope <Primary><Alt>k
;filters-mosaic <Primary><Alt>m
;image-resize F2
;layers-new-group <Primary><Shift>m
;layers-visible <Shift>v
;script-fu-add-anim-layer <Primary>F3
;select-border F3
;select-feather <Primary><Alt>z
;select-shrink <Alt>F2

Return	
#IfWinActive

^r::Reload