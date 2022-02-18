#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/mojito

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_VERIFY_USES_LIBRARIES := true
RELAX_USES_LIBRARY_CHECK=true

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# AVB
BOARD_AVB_ENABLE := true

BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
TARGET_PROVIDES_AUDIO_EXTNS := true

# Audio Policy
USE_CUSTOM_AUDIO_POLICY :=1

# Assert
TARGET_OTA_ASSERT_DEVICE := mojito,sunny

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sm6150
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_CAMERA_BOOTTIME_TIMESTAMP := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# DTB
BOARD_BOOT_HEADER_VERSION := 3
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# FM
BOARD_HAVE_QCOM_FM := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(DEVICE_PATH)/configs/vintf/framework_compatibility_matrix.xml \
    vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE += device/qcom/common/compatibility_matrix.xml

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_mojito
TARGET_RECOVERY_DEVICE_MODULES := libinit_mojito

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096

BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237

TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := mojito_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/mojito

# Media
TARGET_DISABLED_UBWC := true

# Partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 4559208448 # ( BOARD_SUPER_PARTITION_SIZE / 2 - 4MB )
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504

BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 112419745792
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

ifeq ($(WITH_GMS),true)
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 536870912
else
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 536870912
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 536870912
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 536870912
endif

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

BOARD_USES_METADATA_PARTITION := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_FLASH_BLOCK_SIZE := 131072

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Screen density
TARGET_SCREEN_DENSITY := 440

# Security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Sepolicy
TARGET_SEPOLICY_DIR := msmsteppe

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Treble
BOARD_VNDK_VERSION := current

# Inherit from proprietary files
include vendor/xiaomi/mojito/BoardConfigVendor.mk
