#copy to ~/.alias
# change this values to your
package=com.mycompany.myapp
BUNDLE_ID=com.mycompany.myapp
avd=MyAvd
simulator_name="iPhone 13"
apk_file="my.apk"
ios_file="my.app"
android_url="https://mydomain.com/my.apk"
ios_url="https://mydomain.com/my.app"
my_project="~/IdeaProjects/myProject"

alias h="history | grep"
alias u='adb shell pm list packages | grep mycomapy | cut -f 2 -d":" | xargs -L1 -t adb uninstall'
alias ui="idb uninstall $BUNDLE_ID"
alias uia='idb list-targets | grep Booted | column -s "|" -t | tr -s " " | cut -d" " -f3 | xargs -L1 -t -I % sh -c "idb uninstall $BUNDLE_ID --udid %"'
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
alias sim="xcrun simctl boot '$simulator_name'"
# edit and update rc file
alias rc="vim ~/.zshrc && . ~/.zshrc"
alias bundletool.jar='java -jar ~/bundletool.jar'
alias stop='adb shell am force-stop $package'
alias stopi='idb terminate $BUNDLE_ID'
alias s='scrcpy'
alias ios_download="curl --output $my_project $ios_url"
alias android_download="curl --output $my_project/$apk_file $android_url"

# Download zip file with app file, unzip and copy to project_dir
ios_download(){
  rm -r $my_project/$ios_file
  mkdir -p ~/temp
  curl --output ~/temp/myapp.zip $ios_url
  unzip ~/temp/myapp.zip -d ~/temp/
  # copy like dir, because app - it's dir
  cp -r ~/temp/$(ls -r ~/temp | head -1) $my_project/$ios_file
  rm -r ~/temp/$(ls -r ~/temp | head -2)
}

