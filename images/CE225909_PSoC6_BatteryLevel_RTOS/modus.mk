################################################################################
# \file modus.mk
# \version 1.0
#
# \brief
# This file has two purposes.
# - The first purpose is to provide information to the makefile build system.
# - The second purpose is to provide information to any IDE about the example.
#   Therefore, this file should not contain anything other than make variables.
#
################################################################################
# \copyright
# Copyright 2019, Cypress Semiconductor Corporation.  All rights reserved.
# You may use this file only in accordance with the license, terms, conditions,
# disclaimers, and limitations in the end user license agreement accompanying
# the software package with which this file was provided.
################################################################################

#
# Toolchain, its optimization level and the configuration (Debug/Release) type
#
TOOLCHAIN=GCC
OPTIMIZATION = Og
CONFIG = Debug

# Define custom linker script location (<ABSOLUTE PATH>/customScript.ld)
# CY_MAINAPP_CM4_LINKER_SCRIPT=

#
# Vector Floating-point flag (soft/hard) selection
# 
VFP_FLAG = soft

#
# The target platform for the example
#
PLATFORMS_VERSION = 1.0
PLATFORM=PSOC6_DUAL_CORE

#
# The default name of this example
#
CY_EXAMPLE_NAME = CE225909_PSoC6_BatteryLevel_RTOS

#
# Description of the example project to display
#
CY_EXAMPLE_DESCRIPTION = This code example demonstrates the implementation of a BLE Battery Service using PSoC 6 MCU with Bluetooth Low Energy (BLE) Connectivity.

#
# New project dialog inclusion
#
CY_SHOW_NEW_PROJECT = true

#
# Valid platforms for this example
#
CY_VALID_PLATFORMS = PSOC6_DUAL_CORE PSOC6_SINGLE_CORE

#
# This is the required SDK for this example
#
CY_REQUIRED_SDK = Cypress SDK[1.1]

#
# Valid devices for this example. If empty, this example works for all devices
#
CY_VALID_DEVICES = CY8C6347BZI-BLD53

#
# The source code for the CM4 application
#
CY_APP_CM4_SOURCE = \
	Source/main.c\
	Source/battery_task.c\
	Source/battery_task.h\
	Source/ble_task.c\
	Source/ble_task.h\
	Source/uart_debug.c\
	Source/uart_debug.h\
	Source/FreeRTOSConfig.h\
	Source/status_led_task.h\
	Source/status_led_task.c\
	Source/stdio_user.h\
	Source/stdio_user.c\
	readme.txt

#
# Paths to use for ModusToolbox IDE 
#
CY_LOCAL_INCLUDE_CM4 = $(CY_GENERATED_DIR)/$(CYMAINAPP_CM4_NAME)

#
# Includes specific to the CM4 application
#
APP_MAINAPP_CM4_INCLUDES = \
	-IGeneratedSource\
	-I$(CY_LOCAL_INCLUDE_CM4)/Source

#
# Compiler flags specific to the CM4 application
#
APP_MAINAPP_CM4_FLAGS =

#
# Defines specific to the CM4 application
#
APP_MAINAPP_CM4_DEFINES = \
	-DAPP_NAME='"$(CY_EXAMPLE_NAME)_cm4"'

#
# Software components needed by CM4
#
CY_MAINAPP_SWCOMP_USED= \
    $(CY_PSOC_LIB_COMP_MIDDLEWARE_BASE)/ble/config/base \
    $(CY_PSOC_LIB_COMP_MIDDLEWARE_BASE)/ble/config/single_cm4_softfp \
	$(CY_PSOC_LIB_COMP_MIDDLEWARE_BASE)/rtos/FreeRTOS/10.0.1/Source \
    $(CY_PSOC_LIB_COMP_BASE)/utilities/retarget_io \

CY_MAINAPP_SWCOMP_EXT= \

#
# Other libraries (.a) needed by the CM4 application
#
APP_MAINAPP_CM4_LIBS = \

#
# The path to the design.modus file
#
CYCONFIG_DESIGN_MODUS = design.modus

#
# Additional (non-core) set of generated source files
#
CYCONFIG_GENERATED_SOURCES = \
	GeneratedSource/cycfg_ble.c \
	GeneratedSource/cycfg_ble.h \

#
# Check that the CYSDK environment variable exists
#
ifndef CYSDK
$(error The SDK must be defined via the CYSDK environment variable)
endif

#
# Include the main makefile for building this type of example
#
include $(CYSDK)/libraries/platforms-$(PLATFORMS_VERSION)/common/find_platform.mk

