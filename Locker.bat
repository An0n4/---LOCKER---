@echo off
if EXIST Locked goto UNLOCK
if NOT EXIST Locked goto MDLOCKER

:CONFIRM
echo Are You sure you want to lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK 
if %cho%==N goto END
echo invalid choice 
goto CONFIRM

:LOCK
ren Locked
echo Folder locked 
attrib +s +h locked

goto End


:UNLOCK
echo Enter password to unlock folder

set/p "pass=>"
if NOT %pass%==pass goto FAIL

attrib -s -h Locked
echo Folder unlocked successfully
goto End

:FAIL
echo Invalid Password
goto UNLOCK

:MDLOCKER 
md Locked
echo Locked created successfully
goto CONFIRM

:End
