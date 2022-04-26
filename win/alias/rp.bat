@echo off
adb shell settings put global http_proxy :0

if "%1"=="r" (goto r) else (goto e )

:r
adb shell settings delete global http_proxy
adb shell settings delete global global_http_proxy_host
adb shell settings delete global global_http_proxy_port
adb shell reboot
:e

