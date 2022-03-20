APP := hi
ROOT := /home/ksi/tst/android
INSTALL_DIR := /data/tmp
NDK_PLATFORM_VER := 15

#/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
ANDROID_NDK_ROOT := $(ROOT)/android-ndk-r15b
ANDROID_NDK_HOST := linux-x86_64
ANDROID_SDK_ROOT := $(ROOT)/android-sdk-linux_86
PREBUILD := $(ANDROID_NDK_ROOT)/toolchains/arm-linux-androideabi-4.9/prebuilt/$(ANDROID_NDK_HOST)

BIN := $(PREBUILD)/bin
LIB := $(ANDROID_NDK_ROOT)/platforms/android-$(NDK_PLATFORM_VER)/arch-arm/usr/lib
INCLUDE := $(ANDROID_NDK_ROOT)/platforms/android-$(NDK_PLATFORM_VER)/arch-arm/usr/include

CC := $(BIN)/arm-linux-androideabi-gcc
GDB_CLIENT := $(BIN)/arm-eabi-gdb

LIBCRT := $(LIB)/crtbegin_dynamic.o

LINKER := /system/bin/linker

DEBUG := -g

CFLAGS := $(DEBUG) -fno-short-enums -I$(INCLUDE)
CFLAGS += -Wl,-rpath-link=$(LIB),-dynamic-linker=$(LINKER) -L$(LIB)
CFLAGS += -nostdlib -lc

all: $(APP)

$(APP): $(APP).c
	$(CC) -o $@ $< $(CFLAGS) $(LIBCRT)

install: $(APP)
	$(ANDROID_SDK_ROOT)/platform-tools/adb push $(APP) $(INSTALL_DIR)/$(APP) 
	$(ANDROID_SDK_ROOT)/platform-tools/adb shell chmod 777 $(INSTALL_DIR)/$(APP)

shell:
	$(ANDROID_SDK_ROOT)/platform-tools/adb shell

run:
	$(ANDROID_SDK_ROOT)/platform-tools/adb shell $(INSTALL_DIR)/$(APP)

debug-install:
	$(ANDROID_SDK_ROOT)/platform-tools/adb push $(PREBUILD)/../gdbserver $(INSTALL_DIR)/gdbserver
	$(ANDROID_SDK_ROOT)/platform-tools/adb shell chmod 777 $(INSTALL_DIR)/gdbserver

debug-go:
	$(ANDROID_SDK_ROOT)/platform-tools/adb forward tcp:1234: tcp:1234
	$(ANDROID_SDK_ROOT)/platform-tools/adb shell $(INSTALL_DIR)/gdbserver :1234 $(INSTALL_DIR)/$(APP)

debug:
	$(GDB_CLIENT) $(APP)

clean:
	@rm -f $(APP).o $(APP)
