export PATH := $(shell scripts/activate.sh)

SOURCE_FOLDER = ./src

TOOLS_PREFIX = i686-elf-

AS = nasm
CC = $(TOOLS_PREFIX)gcc
AR = $(TOOLS_PREFIX)ar
LD = $(TOOLS_PREFIX)ld
OBJDUMP = $(TOOLS_PREFIX)objdump

CFLAGS  = -I ./include -ffreestanding -O2 -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb
CPPFLAGS  = -I ./include -ffreestanding -O2 -nostdlib -Wall -Wextra -Werror -ggdb -fno-exceptions -fno-rtti
LDFLAGS = -O2
ASFLAGS = -felf32
QEMUFLAGS = -m 256M -display sdl -serial mon:stdio -kernel kernel.bin -M accel=kvm:tcg
QEMUFLAGS += -drive file=filesystem.img,index=0,media=disk,format=raw

include scripts/*.mk

# --- Commands --------------------------------------------------------------- #

build: kernel.bin filesystem.img

rebuild: clean build

run: build
	@echo "\n\033[1;37m .. Booting qemu.\033[0m\n"
	@qemu-system-i386 $(QEMUFLAGS)

run-nox: build
	@echo "\n\033[1;37m .. Booting qemu.\033[0m\n"
	@qemu-system-i386 $(QEMUFLAGS) -nographic

debug: build
	@echo "\n\033[1;37m .. Booting qemu (debug).\033[0m\n"
	@qemu-system-i386 $(QEMUFLAGS) -s -S

clean:
	@echo -n "\n\033[1;37m .. Cleaning up Source tree\033[0m"
	@find -name "*.o" -delete
	@find -name "*.c.o" -delete
	@find -name "*.S.o" -delete
	@find -name "*.cpp.o" -delete
	@find -name "*.bin" -delete
	@find -name "*.asm" -delete
	@find -name "*.img" -delete
	@find -name "*.a" -delete
	@echo "\r\033[0m ✅\n"

very-clean: clean
	rm -rf ./cross
	rm -rf ./build/tarballs
	rm -rf ./build

toolchain:
	./scripts/toolchain.sh

# --- Makefile debug --------------------------------------------------------- #

lsincl:
	i686-elf-g++ -E -x c++ - -v < /dev/null

lsobj:
	@echo $(KERNEL_OBJS)

dumpfs: filesystem.img
	od -A d -c $^

# --- Build rules ------------------------------------------------------------ #

%.S.o: %.S
	@echo -n "\033[1;34m 🔧 ASM \033[0m$^ => $@"
	@$(AS) $(ASFLAGS) $^ -o $@
	@echo "\r\033[0m ✅ "

%.c.o: %.c
	@echo -n "\033[1;32m 🔧 GCC \033[0m$^ => $@"
	@$(CC) $(CFLAGS) -c -o $@ $^
	@echo "\r\033[0m ✅ "

%.cpp.o: %.cpp
	@echo -n "\033[1;33m 🔧 G++ \033[0m$^ => $@"
	@$(CC) $(CPPFLAGS) -c -o $@ $^
	@echo "\r\033[0m ✅ "

.PHONY: build rebuild run run-nox debug clean crosscompiler