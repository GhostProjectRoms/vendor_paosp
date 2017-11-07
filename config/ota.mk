# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Amateur
endif

# PornAOSP version
PAOSP_VERSION := PornAOSP-$(shell date +"%y%m%d")-$(OTA_TYPE)
DEVICE := $(subst paosp_,,$(TARGET_PRODUCT))

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.paosp.version=$(PAOSP_VERSION) \
    ro.paosp.type=$(OTA_TYPE)

ifneq ($(OTA_TYPE),Amateur)
# PornAOSP OTA app
PRODUCT_PACKAGES += \
    PornOTA

$(shell echo -e "# OTA_configuration\n \
ota_url=https://mirrors.c0urier.net/android/teamhorizon/O/OTA/ota_$(DEVICE).xml\n \
device_name=ro.paosp.device\n \
release_type=Oreo\n \
version_source=ro.paosp.version\n \
version_delimiter=-\n \
version_position=1\n \
version_format=yyMMdd" > $(ANDROID_BUILD_TOP)/ota_conf)
endif
