## Аналоги adb
### Для девайсов и симуляторов
* https://github.com/facebook/idb мощный тул от фэйсбука, но немного сложноват в настройке
### Для девайсов
* https://github.com/danielpaulus/go-ios - цель автора создать инструмент не привязанный к macos, [подробнее](https://daniel-paulus.medium.com/automate-ios-devices-the-almost-mac-free-way-973e8760f9df)
    * fork который возможно что-то внесёт https://github.com/testingbot/go-ios
* https://github.com/libimobiledevice/libimobiledevice много утилит, в их репозиториях есть ещё проекты, часть их которых включены в этот
* https://github.com/anonymous5l/iConsole  this project just for learn iOS iTunes communication
* https://github.com/electricbubble/gidevice-cli
  * https://github.com/SonicCloudOrg/sonic-ios-bridge - основан на [gidevice](https://github.com/electricbubble/gidevice), но расширяет его. Также у соников много других тулз есть.
* https://github.com/alibaba/taobao-iphone-device python реализация от алибабы
* https://github.com/xuan32546/IOS13-SimulateTouch нужен jailbreak
* https://github.com/iOSForensics/pymobiledevice - реализация libimobiledevice на python
   * https://github.com/doronz88/pymobiledevice3 - реализация libimobiledevice на python3, актиный репозиторий
   * https://github.com/dskrypa/pypod - заточен под ipod
   * https://github.com/qtacore/pymobiledevice - активный форк
* https://github.com/YueChen-C/py-ios-device - информация с устройства включая производительность
   * https://github.com/YueChen-C/java-ios-device - java имплементация
* [fruitstrap](https://github.com/ghughes/fruitstrap) - старый репо с двумя популярными форками
  * https://github.com/ios-control/ios-deploy
  * https://github.com/unprompted/fruitstrap
### Только для симуляторов
* xcrun simctl - основной инструмент для управления симулятором от apple
   * https://github.com/appium/node-simctl
* https://github.com/wix/AppleSimulatorUtils - ещё 1 инструмент для управления симулятором от аппиум. Уммет давать пермишин на трэкинг, чего не умеет simctl
* https://github.com/phonegap/ios-sim
* https://github.com/MobileNativeFoundation/set-simulator-location

## Управление с пк (аналоги scrcpy)
*  https://github.com/facebook/idb ```idb video-stream --fps 30 --format h264 --compression-quality 1.0 --udid <udid> | ffmpeg -f h264 -i pipe:0 -vcodec copy -tune zerolatency -b 900k -framerate 30 -f mpegts udp://127.0.0.1:12345``` только показ экрана
* https://github.com/danielpaulus/quicktime_video_hack - просмотр аля quiktime , но без него. Используется в некотрых реализациях
* Needes jaibreak
  * https://github.com/julioverne/screendump
  * https://github.com/f-viktor/ghetto-scrcpy-iOS
  * https://er.run/blackhole - платная, но рабочая штука
* Needs webdriver agent
  * https://github.com/testingbot/ios-vnc устарел, требует много доработок и зависит от старых репозиториев. Но в теории можно доработать
    * https://github.com/Karazum/ios-vnc - форк с поддержкой линукса
  * Controlfloor
    * https://github.com/nanoscopic/ios_remote_provider
    	Провайдер подключает устройства iOS к ControlFloor. Это настраивает потоковую передачу видео с устройств iOS в браузер, а также позволяет управлять устройствами удаленно.
    * https://github.com/nanoscopic/controlfloor Система дистанционного управления устройствами
  * https://github.com/AirtestProject/iOS-Tagent работает в Airtest ide
  * https://github.com/DeviceFarmer/stf_ios_support крутой проект, сложный в настройках
  * https://github.com/kavichki-test/ios-farm - схожий с stf, но неподдерживаемый проект, как бонус [статья](https://habr.com/ru/post/572668/) и [чат](https://t.me/ios_farm_kavichki)
  * https://github.com/NetrisTV/ws-scrcpy управления через веб девайсами

## Автоматизация
* https://developer.apple.com/documentation/xctest - инструмент для UI тестов от Apple
* [Appium](https://github.com/appium/appium) - фреймворк и куча тулзов для кросплатформенной разработки автотестов
   * https://github.com/appium/WebDriverAgent - форк проекта facebook, отдельный апп, которым можно управлять с помощью http запросов
   * https://github.com/appium/appium-xcuitest-driver - комбинированние web driver agent'а и xcuitest
   * https://github.com/appium/appium-ios-device - апи либа для управления устройства с помощью libmobiledevice
   * https://github.com/appium/appium-ios-simulator апи либа для управления устройства с помощью simctl
* https://github.com/Xappium/xappium.uitest - заявляют о более простой разработке, чем в appium
* https://github.com/Tencent/QTAF - фреймворк для короссплатформенного тестирования
   * https://github.com/tencent/QT4i - драйвер
   * https://github.com/qtacore/iOSUISpy - инструмент для получения xpath аля appium inspector
* https://github.com/wix/Detox - фреймворк для тестирования серого ящика
* https://github.com/NetEaseGame/ATX
   * https://github.com/openatx/facebook-wda
* https://github.com/AirtestProject/Airtest - фреймворк для тестирования игр
* https://github.com/ElectricBubble/gwda - WebDriverAgent ( iOS ) Client Library in Golang

## Разное:
* https://github.com/wsvn53/scrcpy-ios управлять android девайсом с айфона
* https://github.com/troybowman/ios_instruments_client 
* https://www.hex-rays.com/wp-content/uploads/2019/12/ios_debugger_tutorial.pdf
* https://github.com/troybowman/dtxmsg
* https://github.com/apple-cross-toolchain/xcbuild - сборка xcode без macos
* https://github.com/nsoojin/BookStore-iOS
* https://github.com/alibaba/youku-sdk-tool-woodpecker - инструмент для дебага внутри аппа
* https://github.com/vadim-a-yegorov/iOS-Internals-and-Security-Testing - гайд по айос и тестированию безопасности


## jailbreak
* https://checkra.in/releases/
