#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/qcom/taro

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS ?= \
    boot \
    recovery \
    vendor_boot \
    dtbo \
    vbmeta \
    vendor \
    vendor_dlkm \
    odm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Crypto
TW_INCLUDE_CRYPTO := true

# Decryption
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 4
BOARD_RAMDISK_USE_LZ4 := true
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
TARGET_KERNEL_CONFIG := ferrari_defconfig
TARGET_KERNEL_SOURCE := kernel/realme/ferrari

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# File-system
BOARD_HAS_LARGE_FILESYSTEM := true

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

# Partition - Type
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition - Super
BOARD_SUPER_PARTITION_SIZE := 6442450944 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := vendor vendor_dlkm odm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6438256640  # BOARD_SUPER_PARTITION_SIZE - 4MB

# Platform
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
QCOM_BOARD_PLATFORMS += $(PRODUCT_PLATFORM)
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)

# Platform Version
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security Patch
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_SECURITY_PATCH := $(VENDOR_SECURITY_PATCH)

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko"
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.bootimage.build.date.utc=ro.build.date.utc;ro.odm.build.date.utc=ro.build.date.utc;ro.product.build.date.utc=ro.build.date.utc;ro.system.build.date.utc=ro.build.date.utc;ro.system_ext.build.date.utc=ro.build.date.utc;ro.vendor.build.date.utc=ro.build.date.utc"

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Workaround for copy-files error
TARGET_COPY_OUT_VENDOR := vendor