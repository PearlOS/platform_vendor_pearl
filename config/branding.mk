# Set all versions
PEARL_BUILD_TYPE ?= Unofficial

CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)
PEARL_VERSION := 1.0

CUSTOM_PLATFORM_VERSION := 10.0

CUSTOM_DATE_CODE := $(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst cherish_,,$(CUSTOM_BUILD))
CUSTOM_VERSION := Pearl-OS-v$(PEARL_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD)-$(PEARL_BUILD_TYPE)
CUSTOM_VERSION_PROP := ten

CUSTOM_PROPERTIES := \
    ro.pearl.version=$(PEARL_VERSION) \
    ro.pearl.version.display=$(CUSTOM_VERSION) \
    ro.pearl.build_date=$(CUSTOM_BUILD_DATE) \
    ro.pearl.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    ro.pearl.build_type=$(PEARL_BUILD_TYPE) \
    ro.pearl.version=$(PEARL_VERSION)

ifeq ($(PEARL_BUILD_TYPE), Official)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/secure/releasekey
endif
