@echo off

color a
echo ======================
echo      L O C K E R
echo ======================
:START
echo 1.ENCRYPT 
echo 2.DECRYPT
set/p "cho=:"
if %cho%==1 goto LOCK
if %cho%==1 goto INTRO

:INTRO
if EXIST Lock goto UNLOCK
if NOT EXIST Lock goto MDLOCKER

:CONFIRM
echo Are You sure you want to lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK 
if %cho%==N goto END
echo invalid choice 
goto CONFIRM

:LOCK
ren Lock
echo Folder locked 
attrib +s +h Lock

goto End


:UNLOCK
echo Enter password to unlock folder

set/p "pass=>"
if NOT %pass%==pass goto FAIL

attrib -s -h  Lock
echo Folder unlocked successfully
goto End

:FAIL
echo Invalid Password
goto UNLOCK

:MDLOCKER 
md Lock 
echo Video created successfully
goto CONFIRM

:End
