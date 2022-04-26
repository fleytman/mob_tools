@echo off
rem by OptekProduction https://stackoverflow.com/a/14007404
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"') do set ip=%%b
set IPADDRESS=%ip:~1%
echo %IPADDRESS%


