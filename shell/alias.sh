#copy to ~/.alias
# change this values to your
package=com.mycompany.myapp
BUNDLE_ID=com.mycompany.myapp
avd=MyAvd
simulator_name="iPhone 13"
my_project="~/IdeaProjects/myProject"
android_pattern_url="https://mydomain.com/android/my-"
ios_pattern_url="https://mydomain.com/ios/my-"
ios_date_format=+%Y%m%d
android_date_format=+y%m%d
ios_download_file_name=my.zip
apk_file="my.apk"
ios_file="my.app"

alias h="history | grep"
alias u='adb shell pm list packages | grep mycomapy | cut -f 2 -d":" | xargs -L1 -t adb uninstall'
alias ui="idb uninstall $BUNDLE_ID"
alias uia='idb list-targets | grep Booted | column -t | cut -d"|" -f2 | tr -d ' ' | xargs -L1 -t -I % sh -c "idb uninstall $BUNDLE_ID --udid %"'
alias d="adb devices"
alias di='idb list-targets | grep Booted | column -s "|" -t'
alias dip='idb list-targets | grep Booted | column -t | cut -d"|" -f2 | tr -d ' ' | xargs -L1 -t -I % sh -c "idb connect %; idevicepair pair -u %"'
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

check_build_url() {
  local platform="$1"
  local pattern_url
  local date_format
  local file_extension

  if [ "$platform" = "iOS" ]; then
    pattern_url="$ios_pattern_url"
    date_format="$ios_date_format"
    file_extension=".zip"
  elif [ "$platform" = "Android" ]; then
    pattern_url="$android_pattern_url"
    date_format="$android_date_format"
    file_extension=".apk"
  else
    echo "Unsupported platform: $platform"
    return
  fi

  for i in {0..13}; do
    local date_suffix=$(date -v -${i}d $date_format)
    local url="$pattern_url$date_suffix$file_extension"
    echo "Check $url"
    response_code=$(curl -o - -I -L -s -w "%{http_code}" "$url" | tail -n 1)

    if [ "$response_code" -eq 200 ]; then
      echo -e "\nLatest build for $platform on $url"
      if [ "$platform" = "iOS" ]; then
        ios_url=$url
      elif [ "$platform" = "Android" ]; then
        android_url=$url
      fi
      return
    fi
  done

  echo "No $platform dev builds found in the last 14 days"
}

get_ios_url() {
  check_build_url "iOS"
}

get_android_url() {
  check_build_url "Android"
}


android_download(){
  get_android_url
  eval curl --output $my_project/$apk_file "$android_url"
  }

# Download zip file with app file, unzip and copy to project_dir
ios_download() {
  get_ios_url
  local temp_dir=$(eval echo "~/ios_app_temp")
  #eval rm -rf $temp_dir
  eval mkdir -p $temp_dir
  curl --output $temp_dir/$ios_download_file_name $ios_url
  echo "unzip -q $temp_dir/$ios_download_file_name -d $temp_dir/"
  unzip -q $temp_dir/$ios_download_file_name -d $temp_dir/
  # delete and copy like dir, because app - it's dir
  echo "eval rm -r $my_project/$ios_file"
  eval rm -r $my_project/$ios_file
  echo "eval cp -r "$temp_dir/$(ls -ct $temp_dir | head -1)" "$my_project/$ios_file""
  eval cp -r "$temp_dir/$(ls -ct $temp_dir | head -1)" "$my_project/$ios_file"
}
