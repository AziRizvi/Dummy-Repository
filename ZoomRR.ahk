#NoEnv
#SingleInstance Force

;; Call The Function With The Program Name.
MonitorAndAct("Zoom.exe")

MonitorAndAct(programName)

	{

		JoinAction := False
		StartRecordingAction := False
		StopRecordingAction := False
		
		If !WinExist("ahk_exe obs64.exe")
												
			{
				Run, "C:\Program Files\obs-studio\bin\64bit\obs64.exe" , C:\Program Files\obs-studio\bin\64bit
				WinWait, ahk_exe obs64.exe
			}

	;; For Diagnostic Purposes Only

		;; MsgBox 0, Started, The Outer Loop Has Been Started., 1

		Loop
		
				{
					
	;;------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;
	;; --------------------------------------------------------------- CODE BLOCK ONE ----------------------------------------------------------------------------------------;;
	;;------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;

					;; Check If The zWaitingRoomWndClass Window Exists And If It Does, Execute Code Block One.
	
						IfWinExist, ahk_class zWaitingRoomWndClass 
						
							{
								;; Start The Inner Loop When The Waiting Room Window Exists.
								
									Loop 
										
										{
										
											;; Check If The Join Audio Window Exists.
											
												If (!JoinAction && WinExist("ahk_class zJoinAudioWndClass"))
												
													{
														WinActivate, ahk_class zJoinAudioWndClass
														WinWaitActive, ahk_class zJoinAudioWndClass
														SendInput {Tab 3}
														SendInput {Enter}
														Sleep 250
														JoinAction := True
													}
						
											;; If The JoinAction Flag State Is True And The Recording Hasn't Been Started And OBS Exists, Execute This Code.
											
												If (JoinAction && !StartRecordingAction && WinExist("ahk_exe obs64.exe"))
												
													{
	
														WinActivate, ahk_exe obs64.exe														;; Activate OBS.
														WinWaitActive, ahk_exe obs64.exe													;; Wait For OBS To Get Activated.
														
														;; If OBS Is Active, Start The Recording, Else, Activate OBS And Then Start The Recording.
	
																{
																
																	IfWinActive, ahk_exe obs64.exe
																	
																		{
			
																			SendInput ^!a 													;; [OBS Keybind To Start Recording]
																			Sleep 150														;; Wait For The Action To Be Performed.
																			SendInput ^!a													;; (Fail-Safe In Case The Recording Didn't Get Started On The First Go.)
																			Sleep 350														;; Wait For The Action To Be Performed.
																			StartRecordingAction := True									;; Set The Flag State To True.
															
																		}
																		
																	Else
																		
																		{
																		
																			WinActivate, ahk_exe obs64.exe									;; Activate OBS.
																			WinWaitActive, ahk_exe obs64.exe								;; Wait For OBS To Get Activated.
																			SendInput ^!a 													;; [OBS Keybind To Start Recording]
																			Sleep 150														;; Wait For The Action To Be Performed.
																			SendInput ^!a													;; (Fail-Safe In Case The Recording Didn't Get Started On The First Go.)
																			Sleep 350														;; Wait For The Action To Be Performed.
																			StartRecordingAction := True									;; Set The Flag State To True.
			
																		}
																	
																}														

															;; Activate Zoom And Maximize It.
																
																{
																
																	WinActivate, ahk_class ConfMultiTabContentWndClass						;; Activate Zoom.
																	WinWaitActive, ahk_class ConfMultiTabContentWndClass					;; Wait For The Zoom Window Class To Be Activated.

																	;; If Zoom Is Active, Maximize Its Window, Else, Activate It And Then Maximize Its Window.

																		{
																			IfWinActive, ahk_class ConfMultiTabContentWndClass
																			
																				{
						
																					SendInput {LWin Down}{Up}								;; Resize Zoom Window (Maximize It By Sending Window & Up.)
																					Sleep 100												;; Wait For The Window To Be Maximized.
																					SendInput {LWin Down}{Up}								;; (Fail-Safe In-Case The Window Didn't Get Resized On The First Go.)
																					SendInput {LWin Up}										;; Release The Held Down Window Key.
																					SendInput {LWin Up}										;; Fail-Safe To Release The Held Down Window Key.
			
																				}
																				
																			Else
																				
																				{
																				
																					WinActivate, ahk_class ConfMultiTabContentWndClass		;; Activate Zoom.
																					WinWaitActive, ahk_class ConfMultiTabContentWndClass	;; Wait For The Zoom Window Class To Be Activated.																					Sleep 500												;; Wait For The Window To Be Maximized.
																					SendInput {LWin Down}{Up}								;; Resize Zoom Window (Maximize It By Sending Window & Up.)
																					Sleep 100												;; Wait For The Window To Be Maximized.
																					SendInput {LWin Down}{Up}								;; Fail-Safe In-Case The Window Didn't Get Resized.
																					SendInput {LWin Up}										;; Release The Held Down Window Key.
																					SendInput {LWin Up}										;; Fail-Safe To Release The Held Down Window Key.
																					
																				}
				
																		}

																}

														}
								
											;; If The JoinAction Flag State Is True And The Recording Hasn't Been Started And OBS Doesn't Exist, Execute This Code.

												Else If (JoinAction && !StartRecordingAction && !WinExist("ahk_exe obs64.exe"))
												
													{
																							
														Run, "C:\Program Files\obs-studio\bin\64bit\obs64.exe" , C:\Program Files\obs-studio\bin\64bit
														
														WinWait, ahk_exe obs64.exe															;; Wait For OBS To Start/Launch.
														WinActivate, ahk_exe obs64.exe														;; Activate OBS.
														WinWaitActive, ahk_exe obs64.exe													;; Wait For OBS To Get Activated.
														
														;; If OBS Is Active, Start The Recording, Else, Activate OBS And Then Start The Recording.
	
																{
																
																	IfWinActive, ahk_exe obs64.exe
																	
																		{
			
																			SendInput ^!a 													;; [OBS Keybind To Start Recording]
																			Sleep 150														;; Wait For The Action To Be Performed.
																			SendInput ^!a													;; (Fail-Safe In Case The Recording Didn't Get Started On The First Go.)
																			Sleep 350														;; Wait For The Action To Be Performed.
																			StartRecordingAction := True									;; Set The Flag State To True.
															
																		}
																		
																	Else
																		
																		{
																		
																			WinActivate, ahk_exe obs64.exe									;; Activate OBS.
																			WinWaitActive, ahk_exe obs64.exe								;; Wait For OBS To Get Activated.
																			SendInput ^!a 													;; [OBS Keybind To Start Recording]
																			Sleep 150														;; Wait For The Action To Be Performed.
																			SendInput ^!a													;; (Fail-Safe In Case The Recording Didn't Get Started On The First Go.)
																			Sleep 350														;; Wait For The Action To Be Performed.
																			StartRecordingAction := True									;; Set The Flag State To True.
			
																		}
																	
																}														

															;; Activate Zoom And Maximize It.
																
																{
																
																	WinActivate, ahk_class ConfMultiTabContentWndClass						;; Activate Zoom.
																	WinWaitActive, ahk_class ConfMultiTabContentWndClass					;; Wait For The Zoom Window Class To Be Activated.

																	;; If Zoom Is Active, Maximize Its Window, Else, Activate It First And Then Maximize Its Window.

																		{
																			IfWinActive, ahk_class ConfMultiTabContentWndClass
																			
																				{
						
																					SendInput {LWin Down}{Up}								;; Resize Zoom Window (Maximize It By Sending Window & Up.)
																					Sleep 100												;; Wait For The Window To Be Maximized.
																					SendInput {LWin Down}{Up}								;; (Fail-Safe In-Case The Window Didn't Get Resized On The First Go.)
																					SendInput {LWin Up}										;; Release The Held Down Window Key.
																					SendInput {LWin Up}										;; Fail-Safe To Release The Held Down Window Key.
			
																				}
																				
																			Else
																				
																				{
																				
																					WinActivate, ahk_class ConfMultiTabContentWndClass		;; Activate Zoom.
																					WinWaitActive, ahk_class ConfMultiTabContentWndClass	;; Wait For The Zoom Window Class To Be Activated.																					Sleep 500												;; Wait For The Window To Be Maximized.
																					SendInput {LWin Down}{Up}								;; Resize Zoom Window (Maximize It By Sending Window & Up.)
																					Sleep 100												;; Wait For The Window To Be Maximized.
																					SendInput {LWin Down}{Up}								;; Fail-Safe In-Case The Window Didn't Get Resized.
																					SendInput {LWin Up}										;; Release The Held Down Window Key.
																					SendInput {LWin Up}										;; Fail-Safe To Release The Held Down Window Key.
																					
																				}
				
																		}

																}

														}

											;; Break The Inner Loop If The Zoom Meeting Window Exists And The Actions Are Done.
										
												If (WinExist("ahk_class ConfMultiTabContentWndClass") && JoinAction && StartRecordingAction)
												
													{
														Break
														MsgBox 0, Broken, The Inner Loop Has Been Broken., 1
													}
												
											;; Add A Small Sleep To Ensure The Inner Running Loop Doesn't Increase CPU Usage Too Much.
											
												Sleep 100
	
									}
							}				

	;;------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;
	;; --------------------------------------------------------------- CODE BLOCK TWO ----------------------------------------------------------------------------------------;;
	;;------------------------------------------------------------------------------------------------------------------------------------------------------------------------;;
	
					;; If The Zoom Meeting Window No Longer Exists And The Flag States Are True, Execute Code Block Two.

						If (!WinExist("ahk_class ConfMultiTabContentWndClass") && JoinAction && StartRecordingAction)
						
							{
								;; Activate OBS And Stop The Recording.
								
									WinActivate, ahk_exe obs64.exe			;; Activate OBS.
									WinWaitActive, ahk_exe obs64.exe		;; Wait For OBS To Get Activated.
									SendInput ^!s 							;; [OBS Keybind To Stop Recording]
									Sleep 150								;; Wait For The Action To Be Performed.
									Sendinput ^!s 							;; Fail-Safe In Case The Recording Didn't Get Stopped On The First Go.
									Sleep 350								;; Wait For The Action To Be Performed.
									StopRecordingAction := True				;; Set The Flag State To True.
							}
							
							;; If The Recording Was Stopped Then Break Out Of The Loop.
								
									If (StopRecordingAction)
									
										{
											Break
											MsgBox 0, Broken, The Outer Loop Has Been Broken., 1
										}
			
								;; Add A Small Sleep To Ensure The Outer Running Loop Doesn't Increase CPU Usage Too Much.
								
									Sleep 100
	
				}
	}
