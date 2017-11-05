# Inherit mini common PornAOSP stuff
$(call inherit-product, vendor/paosp/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/paosp/config/telephony.mk)
