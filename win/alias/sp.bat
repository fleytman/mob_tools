@echo off
rem for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set IPADDRESS=%%a
call ip /v
adb shell settings put global http_proxy %IPADDRESS%:8888