REM adb command for all connected devices
FOR /F "skip=1"  %%x IN ('adb devices') DO start adb -s %%x %*