#!/system/bin/sh
pkill brcm
echo 0 > /sys/class/rfkill/rfkill0/state
