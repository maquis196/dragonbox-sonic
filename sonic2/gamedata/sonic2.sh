#!/bin/bash
pwd=`dirname $(readlink -f "$0")`

cd "$pwd"

echo "--------------------------------------------------------------"
echo "Setting PATH to $pwd:$PATH"
export PATH=$pwd:$PATH

echo "--------------------------------------------------------------"
echo "Setting HOME to $pwd"
export HOME=$pwd
export XDG_HOME_DIRS=$pwd
export XDG_CONFIG_HOME=$pwd

if [ ! -e "settings.ini"];then
   echo "first run, copying settings.ini"
   cp defaults/settings.ini /dragonbox/appdata/sonic2/
fi

if [ ! -f "data.rsdk" ];then
   zenity --error --width=400 --height=200 --text="Sonic The Hedgehog data file not found, please copy into /dragonbox/appdata/sonic2/ directory" --timeout=10
   exit 1
fi

gl4es ./RSDKv4 "$@"
