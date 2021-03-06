LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/lib/Makefile.inc

LOCAL_MODULE:= libcurl

LOCAL_ARM_MODE := arm   

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif

CFLAGS := -Wpointer-arith -Wwrite-strings -Wunused -Winline \
 -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long \
 -Wfloat-equal -Wno-multichar -Wsign-compare -Wno-format-nonliteral \
 -Wendif-labels -Wstrict-prototypes -Wdeclaration-after-statement \
 -Wno-system-headers -DHAVE_CONFIG_H


LOCAL_SRC_FILES := $(addprefix lib/,$(CSOURCES))
LOCAL_CFLAGS += $(CFLAGS)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include/ $(LOCAL_PATH)/lib

#LOCAL_COPY_HEADERS_TO := libcurl
#LOCAL_COPY_HEADERS := $(addprefix /include/curlo/,$(HHEADERS))


include $(BUILD_STATIC_LIBRARY)
