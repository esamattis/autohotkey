﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Send backtick
§::
SendInput, ``
SendInput {Space}
return

; And single quote
½::
SendInput, '
return

; US layout style curly bracket insertion
å::
SendRaw, {
return

¨::
SendRaw, }
return


;; Emulate macOS command key with Alt

; copy
!c::
Send ^c
return

; select all
!a::
Send ^a
return

; paste
!v::
Send ^v
return

; cut
!x::
Send ^x
return

; save
!s::
Send ^s
return

; new tab
!t::
Send ^t
return

; close tab
!w::
Send ^w
return

; new window
!n::
Send ^n
return

; undo
!z::
Send ^z
return

; search
!f::
Send ^f
return

; Vim move

!h::
Send {Left}
return

!+h::
Send +{Left}
return

!^h::
Send ^{Left}
return

!+^h::
Send +^{Left}
return

!j::
Send {Down}
return

!+j::
Send +{Down}
return

!k::
Send {Up}
return

!+k::
Send +{Up}
return

!l::
Send {Right}
return

!+l::
Send +{Right}
return

!^l::
Send ^{Right}
return

!+^l::
Send +^{Right}
return

; Spectacle style window tiling

#z::
MoveIt(1)
return

#x::
MoveIt(2)
return

#c::
MoveIt(3)
return

#a::
MoveIt(4)
return

#s::
MoveIt(5)
return

#d::
MoveIt(6)
return

#q::
MoveIt(7)
return

#w::
MoveIt(8)
return

#e::
MoveIt(9)
return

; https://autohotkey.com/board/topic/108780-move-window-to-half-quarter-of-current-monitor/
MoveIt(Q)
{
  ; Get the windows pos
	WinGetPos,X,Y,W,H,A,,,
	WinGet,M,MinMax,A

  ; Calculate the top center edge
  CX := X + W/2
  CY := Y + 20

;  MsgBox, X: %X% Y: %Y% W: %W% H: %H% CX: %CX% CY: %CY%

  SysGet, Count, MonitorCount

  num = 1
  Loop, %Count%
  {
    SysGet, Mon, MonitorWorkArea, %num%

    if( CX >= MonLeft && CX <= MonRight && CY >= MonTop && CY <= MonBottom )
    {
		MW := (MonRight - MonLeft)
		MH := (MonBottom - MonTop)
		MHW := (MW / 2)
		MHH := (MH / 2)
		MMX := MonLeft + MHW
		MMY := MonTop + MHH

		if( M != 0 )
			WinRestore,A

		if( Q == 1 )
			WinMove,A,,MonLeft,MMY,MHW,MHH
		if( Q == 2 )
			WinMove,A,,MonLeft,MMY,MW,MHH
		if( Q == 3 )
			WinMove,A,,MMX,MMY,MHW,MHH
		if( Q == 4 )
			WinMove,A,,MonLeft,MonTop,MHW,MH
		if( Q == 5 )
		{
			if( M == 0 )
				WinMaximize,A
			else
				WinRestore,A
		}
		if( Q == 6 )
			WinMove,A,,MMX,MonTop,MHW,MH
		if( Q == 7 )
			WinMove,A,,MonLeft,MonTop,MHW,MHH
		if( Q == 8 )
			WinMove,A,,MonLeft,MonTop,MW,MHH
		if( Q == 9 )
			WinMove,A,,MMX,MonTop,MHW,MHH
        return
    }

    num += 1
  }

return
}
