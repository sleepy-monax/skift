export PATH := $(shell scripts/activate.sh)

SOURCE_FOLDER = .

ifndef TOOLS_PREFIX
	TOOLS_PREFIX = i686-elf-
else
	KCFLAGS = -m32
	KCPPFLAGS = -m32
endif

AS = nasm
CC = $(TOOLS_PREFIX)gcc
AR = $(TOOLS_PREFIX)ar
LD = $(TOOLS_PREFIX)ld
OBJDUMP = $(TOOLS_PREFIX)objdump

KCFLAGS   += -D __KERNEL -I ./include -ffreestanding -O3 -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb -nostdinc
KCPPFLAGS += -D __KERNEL -I ./include -ffreestanding -O3 -nostdlib -Wall -Wextra -Werror -ggdb -fno-exceptions -fno-rtti

CFLAGS    += -D __USER -I ./include -O3 -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb -nostdinc
CPPFLAGS  += -D __USER -I ./include -O3 -nostdlib -Wall -Wextra -Werror -ggdb -fno-exceptions -fno-rtti

LDFLAGS   += -O3
ASFLAGS   += -felf32

QEMUFLAGS += -m 256M -serial mon:stdio -cdrom image.iso -M accel=kvm:tcg

# --- Commands --------------------------------------------------------------- #

all: image.iso

rebuild: clean all

run: all
	@echo "Booting qemu..."
	@qemu-system-i386 $(QEMUFLAGS)

run-nox: all
	@echo "Booting qemu (nox)..."
	@qemu-system-i386 $(QEMUFLAGS) -nographic

bochs: all
	bochs


debug: all
	@echo "Booting qemu (debug)..."
	@qemu-system-i386 $(QEMUFLAGS) -s -S

clean:
	@echo "Cleaning up Source tree..."
	@find -name "*.o" -delete
	@find -name "*.c.o" -delete
	@find -name "*.S.o" -delete
	@find -name "*.cpp.o" -delete
	@find -name "*.c.ko" -delete
	@find -name "*.S.ko" -delete
	@find -name "*.cpp.ko" -delete
	@find -name "*.bin" -delete
	@find -name "*.asm" -delete
	@find -name "*.img" -delete
	@find -name "*.a" -delete
	@find -name "*.iso" -delete
	@find -name "*.tar" -delete

very-clean: clean
	rm -rf ./cross
	rm -rf ./build/tarballs
	rm -rf ./build

toolchain:
	cd scripts; ./toolchain.sh

# --- Makefile debug --------------------------------------------------------- #

lsobj:
	@echo $(KERNEL_OBJS)

dumpfs: filesystem.img
	od -A d -c $^

# --- Build rules ------------------------------------------------------------ #

include scripts/*.mk

%.S.o: %.S
	@echo "AS $@ -> $^"
	@$(AS) $(ASFLAGS) $^ -o $@


%.c.o: %.c
	@echo "CC $@ -> $^"
	@$(CC) $(CFLAGS) -c -o $@ $^


%.cpp.o: %.cpp
	@echo "CPP $@ -> $^"
	@$(CC) $(CPPFLAGS) -c -o $@ $^

# KERNEL OBJECT SPECIFIC RULES
%.c.ko: %.c
	@echo "CC $@ -> $^"
	@$(CC) $(KCFLAGS) -c -o $@ $^

%.cpp.ko: %.cpp
	@echo "CPP $@ -> $^"
	$(CC) $(KCPPFLAGS) -c -o $@ $^

.PHONY: all rebuild run run-nox debug clean toolchain
