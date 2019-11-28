# Versioning System
PEARL_BASE_VERSION = Alpha-Q
PEARL_BUILD_TYPE := Pearl-OS

TARGET_PRODUCT_SHORT := $(subst pearl_,,$(PEARL_BUILD_TYPE))

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
PEARL_VERSION := $(PEARL_BUILD_TYPE)-$(PEARL_BASE_VERSION)-$(PEARL_BUILD)-$(BUILD_DATE)-$(BUILD_TIME)
TARGET_BACON_NAME := $(DU_VERSION)
ROM_FINGERPRINT := Pearl-OS/$(PLATFORM_VERSION)/$(DU_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    ro.pearl.build.date=$(BUILD_DATE) \
    ro.pearl.version=$(PEARL_VERSION) \
    ro.pearl.fingerprint=$(ROM_FINGERPRINT)
