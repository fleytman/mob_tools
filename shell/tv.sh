ADB_DEVICE_TV=192.168.1.100

tv_command() {
    adb connect $ADB_DEVICE_TV && adb -s $ADB_DEVICE_TV $@
}

tv_keyevent() {
    tv_command shell input keyevent $@
}

# set brightness from 0 to 100 on xiami tv 4s ru
alias tv_brightness="tv_command shell settings put global picture_backlight"
#brightness up/dowm not work on xiami tv 4s ru
alias tv_brightness_down="tv_keyevent 220"
alias tv_brightness_up="tv_keyevent 221"

alias tv_home="tv_keyevent 3"
alias tv_menu="tv_keyevent 82"
alias tv_back="tv_keyevent 4"
alias tv_power="tv_keyevent 26"
alias tv_sleep="tv_keyevent KEYCODE_SLEEP"
alias tv_wakeup="tv_keyevent KEYCODE_WAKEUP"

alias tv_key_pound="tv_keyevent 18"
alias tv_key_dpad_up="tv_keyevent 19"
alias tv_key_dpad_down="tv_keyevent 20"
alias tv_key_dpad_left="tv_keyevent 21"
alias tv_key_dpad_right="tv_keyevent 22"
alias tv_key_dpad_center="tv_keyevent 23"
alias tv_key_volume_up="tv_keyevent 24"
alias tv_key_volume_down="tv_keyevent 25"
# # set volume from 0 to 100 on xiami tv 4s ru see https://stackoverflow.com/a/52949888/4121942
alias tv_set_volume="tv_command shell media volume --show --stream 3 --set"

alias tv_key_media_play_pause="tv_keyevent 85"
alias tv_key_media_stop="tv_keyevent 86"
alias tv_key_media_next="tv_keyevent 87"
alias tv_key_media_play="tv_keyevent 126"
alias tv_key_media_pause="tv_keyevent 127"
alias tv_key_settings="tv_keyevent 176"
alias tv_key_tv_power="tv_keyevent 177"
alias tv_key_tv_input="tv_keyevent 178"
alias tv_key_stb_power="tv_keyevent 179"
alias tv_key_stb_input="tv_keyevent 180"
alias tv_key_avr_power="tv_keyevent 181"
alias tv_key_avr_input="tv_keyevent 182"
alias tv_key_all_apps="tv_keyevent 284"
alias tv_key_refresh="tv_keyevent 28"

# change source to hdmi for mitv 4s ru
alias tv_input_hdmi1="tv_command shell am start -a android.intent.action.VIEW -d content://android.media.tv/passthrough/com.mediatek.tvinput%2F.hdmi.HDMIInputService%2FHW2 -f 0x10000000"
alias tv_input_hdmi2="tv_command shell am start -a android.intent.action.VIEW -d content://android.media.tv/passthrough/com.mediatek.tvinput%2F.hdmi.HDMIInputService%2FHW3 -f 0x10000000"
alias tv_input_hdmi3="tv_command shell am start -a android.intent.action.VIEW -d content://android.media.tv/passthrough/com.mediatek.tvinput%2F.hdmi.HDMIInputService%2FHW4 -f 0x10000000"
alias tv_input_hdmi4="tv_command shell am start -a android.intent.action.VIEW -d content://android.media.tv/passthrough/com.mediatek.tvinput%2F.hdmi.HDMIInputService%2FHW5 -f 0x10000000"
# short alias for prefer hdmi source
alias hdmi=tv_input_hdmi2

alias tv_power_picture_off="tv_command shell settings put global power_picture_off"
