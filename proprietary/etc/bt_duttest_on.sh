#!/system/bin/sh
echo 1 > /sys/class/rfkill/rfkill0/state
/system/bin/brcm_patchram_plus --no2bytes --enable_hci --baudrate 3000000 --use_baudrate_for_download --tosleep 3000 --patchram  /system/etc/bcm4330.hcd /dev/ttyMFD0&
sleep 7
hciconfig hci0 up
sleep 1
hcitool cmd 03 03

hcitool cmd 03 1a 03

hcitool cmd 03 05 02 00 02

hcitool cmd 06 03

