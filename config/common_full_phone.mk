# Inherit full common PornAOSP stuff
$(call inherit-product, vendor/paosp/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include PornAOSP LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/paosp/overlay/dictionaries

$(call inherit-product, vendor/paosp/config/telephony.mk)
