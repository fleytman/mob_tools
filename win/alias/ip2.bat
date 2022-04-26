@echo off
rem by Fabio Iotti https://stackoverflow.com/a/17634009
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set IPADDRESS=%%a
echo %IPADDRESS%
