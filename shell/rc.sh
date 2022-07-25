# Copy from this file to ~/.zshrc or ~/.bashrc

#java uncommect and add your paths
#export JAVA_HOME=/usr/local/opt/openjdk@11
#export CPPFLAGS=-I/usr/local/opt/openjdk@11/include
#export PATH="$JAVA_HOME/bin:$PATH"
#android tools
export ANDROID_AVD_HOME=$HOME/.android/avd/
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_LATEST_BUILD_TOOLS=$(ls -r ${ANDROID_HOME}/build-tools|head -1)
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
# New tools for work with java > 8 see https://issuetracker.google.com/issues/67495440
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_LATEST_BUILD_TOOLS
# history no duplicates for zsh
#export HISTCONTROL=ignoreboth:erasedups
#setopt HIST_EXPIRE_DUPS_FIRST
#setopt HIST_IGNORE_DUPS
#setopt HIST_IGNORE_ALL_DUPS
#setopt HIST_IGNORE_SPACE
#setopt HIST_FIND_NO_DUPS

# tglogcat 10 - log for last 10 min
tlogcat(){
adb logcat -T "$(date -j -f "%Y-%m-%d %H:%M" "$(date -v -$1M +"%Y-%m-%d %H:%M")" +'%m-%d %H:%M:%S.000')" $@
}

# show layout
slb(){
if [ "$1" = "1" ]
then
adb shell setprop debug.layout true
adb shell service call activity 1599295570
elif [ "$1" = "0" ]
then
adb shell setprop debug.layout false
adb shell service call activity 1599295570
fi
adb shell settings getprop debug.layout
}

# show touches
stl(){
if [ "$1" = "1" ]
then adb shell settings put system show_touches 1
elif [ "$1" = "0" ]
then adb shell settings put system show_touches 0
fi
adb shell settings get system show_touches
}

# show pointer
spl(){
if [ "$1" = "1" ]
then adb shell settings put system pointer_location 1
elif [ "$1" = "0" ]
then adb shell settings put system pointer_location 0
fi
adb shell settings get system pointer_location
}

# dont keep activities
dka(){
if [ "$1" = "1" ]
then adb shell settings put global always_finish_activities 1
elif [ "$1" = "0" ]
then adb shell settings put global always_finish_activities 0
fi
adb shell settings get global always_finish_activities
}

# set proxy
sp(){
IPADDRESS="$(ipconfig getifaddr en0)"
adb shell settings put global http_proxy $IPADDRESS:9090
echo The proxy:$IPADDRESS:9090 has been set to the phone
}

# reset proxy
rp(){
echo The proxy has been reset from the phone
adb shell settings put global http_proxy :0
if [ "$1" = "r" ];
then
adb shell settings delete global http_proxy
adb shell settings delete global global_http_proxy_host
adb shell settings delete global global_http_proxy_port
adb shell reboot
fi
}

if [ -f ~/.alias ]; then
. ~/.alias
fi