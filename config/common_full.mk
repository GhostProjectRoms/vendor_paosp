# Inherit common PornAOSP stuff
$(call inherit-product, vendor/paosp/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
