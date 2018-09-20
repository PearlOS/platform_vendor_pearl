include vendor/du/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pearl/config/BoardConfigQcom.mk
endif
