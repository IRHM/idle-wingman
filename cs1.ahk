#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

if !WinExist("Counter-Strike: Global Offensive"){
	; If CSGO not open exit ahk app
	MsgBox, CSGO App Not Open
	ExitApp
}

; STOP KICK COMMAND

WinActivate, Counter-Strike: Global Offensive				; Activate CSGO window
Send, ``													; Open console
Sleep, 250													; Sleep 50ms
Send, {+}left; {+}right										; Type command to stop afk kick
Sleep, 250													; Sleep 250ms
SendInput {enter}											; Press enter
Send, ``													; Close console

; LOOP TO START GAMES

Loop{
	if !WinActive("Counter-Strike: Global Offensive"){
		WinActivate, Counter-Strike: Global Offensive		; Activate CSGO window
	}
	
	PixelGetColor, PlayButtonColour, 26, 97, RGB 			; Get color of play button

	; MsgBox, "%PlayButtonColour%"

	if(PlayButtonColour = "0xFFFFFF"){
		; Turn off holiday mode
		; WinActivate, Counter-Strike: Global Offensive		; Activate CSGO window
		; Send, ``											; Open console
		; Sleep, 250										; Sleep 50ms
		; Send, sv_holiday_mode 0							; Type command turn off holiday mode
		; Sleep, 250										; Sleep 250ms
		; SendInput {enter}									; Press enter
		; Send, ``											; Close console
		; sleep, 500
	
		; Search for game
		MouseClick, Left, 26, 97 							; Click play button
		Sleep, 1000 										; Sleep 1 second
		MouseClick, Left, 135, 110							; Click on Wingman tab
		Sleep, 1000											; Sleep 1 second
		MouseClick, Left, 500, 484							; Click GO
	}
	else{
		; Confirm match
		PixelGetColor, AcceptColour, 366, 308, RGB 			; Get color of accept btn*

		if(AcceptColour = "0x4CAF50"){
			MouseClick, Left, 366, 308						; Click accept
			Sleep, 250
			MouseClick, Left, 366, 308						; Click accept
		}
	}
	
	PixelGetColor, NotAcceptRialtoColor, 531, 316, RGB 		; Get color of rialto tick with overlay

	if(NotAcceptRialtoColor = "0x888889"){
		MouseClick, Left, 450, 298							; Click ok on fail to accept msgbox
		Sleep, 250											; Sleep 250ms
		MouseClick, Left, 18, 44							; Click on home button
	}

	sleep, 1000												; Sleep 1 seconds
}

