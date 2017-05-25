$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Nvidia hardware, vendor blobs
$(call inherit-product, vendor/nvidia/tegra3/nvidia-vendor.mk)
$(call inherit-product-if-exists, vendor/lenovo/a2109/device-vendor.mk)
$(call inherit-product, hardware/nvidia/tegra3/tegra3.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/a2109/overlay

LOCAL_PATH := device/lenovo/a2109

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Init files
PRODUCT_COPY_FILES += \
    device/lenovo/a2109/fstab.kai:root/fstab.kai \
    device/lenovo/a2109/init.kai.rc:root/init.kai.rc \
    device/lenovo/a2109/init.IdeaTabA2109A_board.usb.rc:root/init.IdeaTabA2109A_board.usb.rc \
    device/lenovo/a2109/ueventd.kai.rc:root/ueventd.kai.rc

# Build characteristics setting
PRODUCT_CHARACTERISTICS := tablet

# Copied from grouper
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=y \
    persist.sys.media.legacy-drm=true \
    drm.service.enabled=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf


PRODUCT_PACKAGES += \
    audio.primary.tegra3 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    librs_jni \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    libinvensense_mpl \
    lights.kai \

PRODUCT_PACKAGES += \
    tinymix \
    tinyplay \
    tinycap \
    tinypcminfo

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Wrappers
PRODUCT_PACKAGES += \
    libgpsd-compat \
    libstlport

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# A2109A specific config files
# Audio config
PRODUCT_COPY_FILES += \
    device/lenovo/a2109/audio/tiny_hw.xml:system/etc/tiny_hw.xml \
    device/lenovo/a2109/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    device/lenovo/a2109/config/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/a2109/config:system/usr/idc/raydium_ts.idc \
    device/lenovo/a2109/config:system/usr/idc/sensor00fn11.idc \
    device/lenovo/a2109/config/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/lenovo/a2109/config/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/lenovo/a2109/config/keylayout/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
    device/lenovo/a2109/config/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/lenovo/a2109/config/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lenovo/a2109/config/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    device/lenovo/a2109/config/gps.xml:system/etc/gps/gps.xml \
    device/lenovo/a2109/config/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/lenovo/a2109/config/media_codecs.xml:system/etc/media_codecs.xml \
    device/lenovo/a2109/config/enctune.conf:system/etc/enctune.conf \
    device/lenovo/a2109/config/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Add permissions, copied straight from grouper
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

WIFI_BAND := 802_11_BG
 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)