Шпаргалка полезных команд adb
Рекомендую также ознакомиться этим списком: https://gist.github.com/bbsusheelkumar/357c62202bda3d905d589046b95d157b

Получить значение яркости

    adb shell settings get system screen_brightness

Установить значение яркости

    adb shell settings put system screen_brightness 0

Или в  xiaomi tv

    adb shell settings put global picture_backlight 0

Или клавишей

    adb shell input keyevent 220
    adb shell input keyevent 221

Открыть настройки

    adb shell am start -a android.settings.SETTINGS

  

Показывать позицию

	adb shell settings put system pointer_location 1

Показывать пальцы

	adb shell settings put system show_touches 1

  

Don't keep activites on/off

	adb shell settings put global always_finish_activities 1
	adb shell settings put global always_finish_activities 0

Убить приложение

	adb shell am kill com.mycompany.myapp

 Установка системного аппа включая  >api29

https://stackoverflow.com/questions/55030788/adb-remount-fails-mount-system-not-in-proc-mounts

	adb root
	adb shell avbctl disable-verification
	adb remount
	adb shell "su 0 mount -o rw,remount /system"
	adb push myapp.apk /system/app/mycompany/myapp.apk
	adb reboot

Смена языка

Сперва надо скачать апкашку [io.appium.settings](https://github.com/appium/io.appium.settings)
	
	curl -sL <https://github.com/appium/io.appium.settings/releases/latest/download/settings_apk-debug.apk> -o settings_apk-debug.apk

Устанавливать с

	adb install -g

или дать права вручную

	adb shell pm grant io.appium.settings android.permission.CHANGE_CONFIGURATION

Сменить на русский

	adb shell am broadcast -a io.appium.settings.locale -n io.appium.settings/.receivers.LocaleSettingReceiver --es lang ru --es country RU
Сменить на английский

	adb shell am broadcast -a io.appium.settings.locale -n io.appium.settings/.receivers.LocaleSettingReceiver --es lang en --es country US
	
Проверить локаль

	adb shell getprop persist.sys.locale

С перезагрузкой

    adb shell "setprop persist.sys.language ru; setprop persist.sys.country RU; setprop ctl.restart zygote"

    adb shell "setprop persist.sys.language en; setprop persist.sys.country US; setprop ctl.restart zygote"

  
Размер девайса

	adb shell wm size 1080x1920
	adb shell wm density 480

Сбросить

	adb shell wm size reset
	adb shell wm density reset

  Показ границ элементов

https://susuthapa19961227.medium.com/enable-layout-debugging-in-android-using-adb-64016d755441

	adb shell setprop debug.layout true
	adb shell service call activity 1599295570

  https://github.com/kyze8439690/DevelopQuickSetting

adb shell service check SurfaceFlinger

## Эмулятор
Список AVD

	emulator -list-avds

Включить конкретный AVD из консоли

	emulator -avd myAVD

  ## Logcat
  Исключить из logcat 

https://stackoverflow.com/questions/5511433/how-to-exclude-certain-messages-by-tag-name-using-android-adb-logcat

    adb -e logcat "com.mycompany.myapp:I *:E" | grep --invert-match 'p2p\|WifiP2pService\|QEMU\|WifiP2pNative\|SupplicantP2pIfaceHal\|OMXNodeInstance'

или win версия https://superuser.com/posts/909130/revisions

    adb -e logcat "com.mycompany.myapp:I *:E" | findstr /v "p2p WifiP2pService QEMU WifiP2pNative SupplicantP2pIfaceHal OMXNodeInstance wpa_supplicant"



