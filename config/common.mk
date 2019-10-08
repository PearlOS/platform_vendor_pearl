PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_BRAND ?= PEARL-OS

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

# General additions
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.setupwizard.rotation_locked=true \
    ro.build.selinux=1

# Allow tethering without provisioning app
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner \
    vendor/pearl/prebuilt/common/bin/sysinit:$(TARGET_COPY_OUT_SYSTEM)/bin/sysinit

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/pearl/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pearl/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pearl/prebuilt/common/bin/50-pearl.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-pearl.sh \
    vendor/pearl/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

# Recorder permissions
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/permissions/privapp-permissions-recorder.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-recorder.xml

PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/permissions/pearl-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pearl-power-whitelist.xml \
    vendor/pearl/prebuilt/common/etc/permissions/privapp-permissions-pearl--system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-pearl-system.xml \
    vendor/pearl/prebuilt/common/etc/permissions/privapp-permissions-pearl-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-pearl-product.xml \
    vendor/pearl/prebuilt/common/etc/permissions/pearl-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/pearl-hiddenapi-package-whitelist.xml

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    nano \
    mkfs.ntfs \
    mount.ntfs

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Packages
include vendor/pearl/config/packages.mk

# Branding
include vendor/pearl/config/branding.mk

# Themes
include vendor/themes/common.mk

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pearl/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/pearl/overlay/common
