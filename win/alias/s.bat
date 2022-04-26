@echo off
if "%1"=="c" goto console

FOR /F "skip=1"  %%x IN ('adb devices') DO start scrcpy-noconsole -s %%x --stay-awake
exit
:console
FOR /F "skip=1"  %%x IN ('adb devices') DO start scrcpy -s %%x --stay-awake