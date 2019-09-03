include vendor/pearl/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pearl/config/BoardConfigQcom.mk
endif

ifneq ($(FORCE_QCOM_DISPLAY_HAL_VARIANT),)
include vendor/pearl/config/BoardConfigQcomDisplayOverride.mk
endif

include vendor/pearl/config/BoardConfigSoong.mk
