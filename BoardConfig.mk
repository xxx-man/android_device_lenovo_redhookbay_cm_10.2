include $(GENERIC_X86_CONFIG_MK)
LOCAL_PATH := device/lenovo/redhookbay

#Board configuration
TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_ARCH_VARIANT_FPU := sse
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_SMP := true
TARGET_PRELINK_MODULE := false
INTEL_INGREDIENTS_VERSIONS := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DARCH_IA32
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

CM_BUILDTYPE := UNOFFICIAL

#Atom optimizations to improve memory benchmarks.
-include $(LOCAL_PATH)/OptAtom.mk

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := y
BOARD_HAVE_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/fw_bcmdhd.bin"
CONFIG_DRIVER_TEST := true

#Make settings
TARGET_NO_RECOVERY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/blobs/kernel

#Skip doc from building
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_WITH_FULL_STAGEFRIGHT := true

BOARD_HAS_NO_FB2PNG := true
TARGET_GLOBAL_CFLAGS += -DUSE_SSSE3 -DUSE_SSE2

#HW_Rendering
BOARD_USES_HWCOMPOSER := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/proprietary/lib/egl/egl.cfg
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_ALLOW_EGL_HIBERNATION := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
USE_INTEL_MDP := true
TARGET_NO_METADATA_ON_AVC_ENC := true
INTEL_VA := true
ENABLE_IMG_GRAPHICS := true
BOARD_USES_MRST_OMX := true
USE_INTEL_SECURE_AVC := true

#File system
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

#Enable WEBGL in WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

#SELinux
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS += device/lenovo/redhookbay/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    seapp_contexts \
    property_contexts \
    file.te \
    genfs_contexts \
    device.te \
    vold.te \
    ecryptfs.te \
    surfaceflinger.te \
    zygote.te \
    su.te \
    pvrsrvctl.te \
    bluetooth.te \
    mediaserver.te

#Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

#Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF :=  $(LOCAL_PATH)/blobs/bt_vendor.conf

#GPS
BOARD_HAVE_GPS := true

#Select libcamera2 as the camera HAL
USE_CAMERA_HAL2 := true

##########################################################################

TARGET_RECOVERY_KERNEL := $(LOCAL_PATH)/blobs/kernel

# Recovery config global
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 1080x1920
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/recovery.fstab
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/ramdisk/init.rc
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_LCD_BACKLIGHT_PATH := /sys/class/backlight/psb-bl/brightness
RECOVERY_FSTAB_VERSION := 2

# TWRP recovery config
TW_INCLUDE_INJECTTWRP := false
TWRP_EVENT_LOGGING := false
TW_INTERNAL_STORAGE_PATH := "/usbotg"
TW_INTERNAL_STORAGE_MOUNT_POINT := "usbotg"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TWHAVE_SELINUX := false
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/backlight/psb-bl/brightness

#Philz
PHILZ_TOUCH_RECOVERY := true
BOARD_USE_NTFS_3G := false
