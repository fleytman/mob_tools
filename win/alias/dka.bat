@echo off
if "%1"=="1" adb shell settings put global always_finish_activities 1
if "%1"=="0" adb shell settings put global always_finish_activities 0
adb shell settings get global always_finish_activities