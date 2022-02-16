@echo off
title DAVE ACE
color a
echo ======================
echo   E N I G M A T I C
echo ======================
 

:START
echo [1] E N C R Y P T 
echo [2] D E C R Y P T

set/p "cho=:"
if %cho%==1 goto LOCK
if %cho%==2 goto INTRO

:LOCK
attrib +s +h Lock
echo [+]Folder Locked 
goto End


:INTRO
if EXIST Lock goto UNLOCK
if NOT EXIST Lock goto MDLOCKER



:UNLOCK
set /a tries=3
cls
echo ===============
echo   LOGIN PANEL
echo ===============
echo Tries (%tries%)
echo Enter Password
set/p "pass=>"

if NOT %pass%==pass goto FAIL
color a
attrib -s -h  Lock
echo [+] Folder Unlocked Successfully
goto END


:FAIL
cls
color c
echo [!]Invalid Password
pause
goto UNLOCK



:CONFIRM
echo Are You sure you want to lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK 
if %cho%==N goto END
echo invalid choice 
goto CONFIRM


:MDLOCKER 
md Lock 
echo Video created successfully
goto CONFIRM

:END
echo [+] Exiting Program.....
pause
exit
