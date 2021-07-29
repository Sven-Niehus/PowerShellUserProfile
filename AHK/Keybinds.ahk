SetTitleMatchMode, 2 ; 2 = a partial match on the title

; MICROSOFT TEAMS - Toggle Mute
; CTRL+ALT+SHIFT+M
+^!M::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") 
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^+M  
        WinActivate ahk_id %winid% ; Restore previous window focus
	return
}

; MICROSOFT TEAMS - Toggle Camera
; CTRL+ALT+SHIFT+O
+^!O::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") 
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^+O  
        WinActivate ahk_id %winid% ; Restore previous window focus
	return
}

; MICROSOFT TEAMS - Answer Call
; CTRL+ALT+SHIFT+S
+^!S::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") 
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^+S  
        WinActivate ahk_id %winid% ; Restore previous window focus
	return
}

; MICROSOFT TEAMS - Hangup Call
; CTRL+ALT+SHIFT+B
+^!B::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") ;Yes, every Teams meeting has that in the title bar - even if it's not visible to you
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^+B  
        WinActivate ahk_id %winid% ; Restore previous window focus
	return
}

; MICROSOFT TEAMS - Activity
; CTRL+ALT+SHIFT+1
+^!1::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") ;Yes, every Teams meeting has that in the title bar - even if it's not visible to you
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^1
	return
}

; MICROSOFT TEAMS - Chat
; CTRL+ALT+SHIFT+1
+^!2::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") ;Yes, every Teams meeting has that in the title bar - even if it's not visible to you
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^2
	return
}

; MICROSOFT TEAMS - Teams
; CTRL+ALT+SHIFT+1
+^!3::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") ;Yes, every Teams meeting has that in the title bar - even if it's not visible to you
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^3
	return
}

; MICROSOFT TEAMS - Calendar
; CTRL+ALT+SHIFT+1
+^!4::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") ;Yes, every Teams meeting has that in the title bar - even if it's not visible to you
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^4
	return
}

; MICROSOFT TEAMS - Calls
; CTRL+ALT+SHIFT+1
+^!5::
WinGet, winid, ID, A	; Save the current window ID
if WinExist("| Microsoft Teams") ;Yes, every Teams meeting has that in the title bar - even if it's not visible to you
{
	WinActivate ; Without any parameters this activates the previously retrieved window
	Send, ^5
	return
}

; Time Tracking

; Time Tracking - ABC Support
; CTRL+ALT+SHIFT+F13
+^!F13::
SplashTextOn, 200, 25, TimeTracking, TimeTracking in 1 Sekunde!
WinMove, TimeTracking,, 860, 200
Sleep, 1000
SplashTextOff

InputBox, UserInput, TimeTracking - ABC Support, Bitte Beschreibung eingeben:, , 640, 130, 640, 200, , , Support (
if Not ErrorLevel
{
	FormatTime, CurrentDateTime , ,  yyyy-MM-dd HH:mm:ss
	TimeTrackingLine = %CurrentDateTime%; ABC; Support;%UserInput%
	FileAppend, %TimeTrackingLine%`r`n, C:\Users\niehus\Documents\TimeTracking.csv
	if ErrorLevel
		MsgBox %A_LastError%
	
	SplashTextOn, 640, 25, TimeTracking, %CurrentDateTime% - %UserInput%
	WinMove, TimeTracking,, 640, 200
	Sleep, 5000
	SplashTextOff
}
return

; Time Tracking - Kunden Support
; CTRL+ALT+SHIFT+F14
+^!F14::
SplashTextOn, 200, 25, TimeTracking, TimeTracking in 1 Sekunde!
WinMove, TimeTracking,, 860, 200
Sleep, 1000
SplashTextOff

InputBox, KundeName, TimeTracking - Kunden Support, Bitte Kundennamen eingeben:, , 640, 130, 640, 200, , ,
InputBox, Beschreibung, TimeTracking - Kunden Support, Bitte Beschreibung eingeben:, , 640, 130, 640, 200, , ,
if Not ErrorLevel
{
	FormatTime, CurrentDateTime , ,  yyyy-MM-dd HH:mm:ss
	TimeTrackingLine = %CurrentDateTime%; %KundeName%; Support;%Beschreibung%
	FileAppend, %TimeTrackingLine%`r`n, C:\Users\niehus\Documents\TimeTracking.csv
	if ErrorLevel
		MsgBox %A_LastError%
	
	SplashTextOn, 640, 25, TimeTracking, %CurrentDateTime% - %KundeName% - %Beschreibung%
	WinMove, TimeTracking,, 640, 200
	Sleep, 5000
	SplashTextOff
}
return

; Time Tracking - ABC Orga
; CTRL+ALT+SHIFT+F22
+^!F22::
SplashTextOn, 200, 25, TimeTracking, TimeTracking in 1 Sekunde!
WinMove, TimeTracking,, 860, 200
Sleep, 1000
SplashTextOff

InputBox, UserInput, TimeTracking - ABC Orga, Bitte Beschreibung eingeben:, , 640, 130, 640, 200, , , Orga
if Not ErrorLevel
{
	FormatTime, CurrentDateTime , ,  yyyy-MM-dd HH:mm:ss
	TimeTrackingLine = %CurrentDateTime%; ABC; Orga;%UserInput%
	FileAppend, %TimeTrackingLine%`r`n, C:\Users\niehus\Documents\TimeTracking.csv
	if ErrorLevel
		MsgBox %A_LastError%
	
	SplashTextOn, 640, 25, TimeTracking, %CurrentDateTime% - %UserInput%
	WinMove, TimeTracking,, 640, 200
	Sleep, 5000
	SplashTextOff
}
return

; Time Tracking - Pause
; CTRL+ALT+SHIFT+F23
+^!F23::
UserInput = "Pause"
FormatTime, CurrentDateTime , ,  yyyy-MM-dd HH:mm:ss
TimeTrackingLine = %CurrentDateTime%; anaptis; Pause;%UserInput%
FileAppend, %TimeTrackingLine%`r`n, C:\Users\niehus\Documents\TimeTracking.csv
if ErrorLevel
	MsgBox %A_LastError%

SplashTextOn, 640, 25, TimeTracking, %CurrentDateTime% - %UserInput%
WinMove, TimeTracking,, 640, 200
Sleep, 5000
SplashTextOff
return

; Time Tracking - 560
; CTRL+ALT+SHIFT+F24
+^!F24::
SplashTextOn, 200, 25, TimeTracking, TimeTracking in 1 Sekunde!
WinMove, TimeTracking,, 860, 200
Sleep, 1000
SplashTextOff

InputBox, UserInput, TimeTracking - anaptis (560), Bitte Beschreibung eingeben:, , 640, 130, 640, 200, , , Eigene Organisation
if Not ErrorLevel
{
	FormatTime, CurrentDateTime , ,  yyyy-MM-dd HH:mm:ss
	TimeTrackingLine = %CurrentDateTime%; anaptis; 560;%UserInput%
	FileAppend, %TimeTrackingLine%`r`n, C:\Users\niehus\Documents\TimeTracking.csv
	if ErrorLevel
		MsgBox %A_LastError%
	
	SplashTextOn, 640, 25, TimeTracking, %CurrentDateTime% - %UserInput%
	WinMove, TimeTracking,, 640, 200
	Sleep, 5000
	SplashTextOff
}
return