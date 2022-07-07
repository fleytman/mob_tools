#copy to ~/.alias
package=com.mycompany.myapp
avd=MyAvd

alias h="history | grep"
alias u='adb shell pm list packages | grep mycomapy | cut -f 2 -d":" | xargs -L1 -t adb uninstall'
alias ui="idb uninstall $package"
alias uia='idb list-targets | grep Booted | column -s "|" -t | tr -s " " | cut -d" " -f3 | xargs -L1 -t -I % sh -c "idb uninstall $package --udid %"'
alias d="adb devices"
alias di='idb list-targets | grep Booted | column -s "|" -t'
alias dip='idb list-targets | grep Booted | column -s "|" -t | tr -s " " | cut -d" " -f3 | xargs -L1 -t -I % sh -c "idb connect %; idevicepair pair -u %"'
alias lh="ls -d .*"
alias apk="adb install"
alias ipa="idb install"
alias ip="ipconfig getifaddr en0"
alias pm="adb shell pm clear $package"
alias ru="adb shell am broadcast -a io.appium.settings.locale -n io.appium.settings/.receivers.LocaleSettingReceiver --es lang ru --es country RU"
alias en="adb shell am broadcast -a io.appium.settings.locale -n io.appium.settings/.receivers.LocaleSettingReceiver --es lang en --es country US"
alias settings="adb shell am start -a android.settings.SETTINGS"
#remove spam from logcat
alias logcat="adb -e logcat '$package:I *:E' | grep --invert-match --line-buffered 'p2p\|WifiP2pService\|QEMU\|WifiP2pNative\|SupplicantP2pIfaceHal\|OMXNodeInstance' | cut -f 2- -d' '"
alias emu="emulator -avd $avd -writable-system -no-snapshot-load"
# edit and update rc file
alias rc="vim ~/.zshrc && . ~/.zshrc"
alias bundletool.jar='java -jar ~/bundletool.jar'
alias stop='adb shell am force-stop $package'
alias stopi='idb terminate $package'
alias s='scrcpy'
