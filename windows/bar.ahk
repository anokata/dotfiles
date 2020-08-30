#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

VarSetCapacity(APPBARDATA, A_PtrSize=4 ? 36:48)

^Space::
   NumPut(DllCall("Shell32\SHAppBarMessage", "UInt", 4 ; ABM_GETSTATE
                                           , "Ptr", &APPBARDATA
                                           , "Int")
 ? 2:1, APPBARDATA, A_PtrSize=4 ? 32:40) ; 2 - ABS_ALWAYSONTOP, 1 - ABS_AUTOHIDE
 , DllCall("Shell32\SHAppBarMessage", "UInt", 10 ; ABM_SETSTATE
                                    , "Ptr", &APPBARDATA)
   KeyWait, % A_ThisHotkey
   Return