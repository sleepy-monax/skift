export PATH := $(shell tools/activate.sh)

SOURCE_FOLDER = ./source

TOOLS_PREFIX = i686-elf-
CC = $(TOOLS_PREFIX)gcc
AR = $(TOOLS_PREFIX)ar
LD = $(TOOLS_PREFIX)ld
AS = nasm
OBJDUMP = $(TOOLS_PREFIX)objdump

CFLAGS  = -I ./include -ffreestanding -O3 -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb
LDFLAGS =
ASFLAGS = -felf32
QEMUFLAGS = -m 256M -display sdl -serial mon:stdio -kernel kernel.bin -M accel=tcg
QEMUFLAGS += -drive file=filesystem.img,index=0,media=disk,format=raw

# --- Commands --------------------------------------------------------------- #
.PHONY: build rebuild run run-nox debug clean crosscompiler

build: kernel.bin filesystem.img

rebuild: clean build

run: build
	@echo "\033[1;37mBooting qemu...\033[0m"
	@qemu-system-i386 $(QEMUFLAGS)

run-nox: build
	@echo "\n\033[1;37mBooting qemu...\033[0m\n"
	@qemu-system-i386 $(QEMUFLAGS) -nographic

debug: build
	@qemu-system-i386 $(QEMUFLAGS) -s -S

clean:
	@echo -n "\n\033[1;37m .. Cleaning up Source tree...\033[0m"
	@find -name "*.o" -delete
	@find -name "*.c.o" -delete
	@find -name "*.S.o" -delete
	@find -name "*.bin" -delete
	@find -name "*.asm" -delete
	@find -name "*.img" -delete
	@find -name "*.a" -delete
	@echo "\r\033[0m ✅\n"

crosscompiler:
	./tools/buildtoolchain.sh

# ============================================================================ #
# =   Libc                                                                   = #
# ============================================================================ #

LIBC_OBJS = $(patsubst %.c,%.c.o,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libc.a: $(LIBC_OBJS)
	$(AR) rcs $@ $^

# ============================================================================ #
# =   File system                                                            = #
# ============================================================================ #

filesystem.img:
	@echo -n "\033[1;37m .. Generating the file system.\033[0m"
	@dd if=/dev/zero of=$@ count=10000 status=none
	@echo "\r\033[0m ✅\n"


# ============================================================================ #
# =   KERNEL                                                                 = #
# ============================================================================ #

KERNEL_OBJS =  $(patsubst %.c,%.c.o,$(shell find $(SOURCE_FOLDER)/kernel -name '*.c'))
KERNEL_OBJS += $(patsubst %.S, %.S.o,$(shell find $(SOURCE_FOLDER)/kernel -name '*.S'))

kernel.bin: $(KERNEL_OBJS) libc.a
	@echo -n "\n\033[1;37m 🔧 Linking the kernel.\033[0m"
	@$(LD) $(LDFLAGS) -T $(SOURCE_FOLDER)/kernel.ld -o $@ $^
	@$(OBJDUMP) -S $@ > kernel.asm
	@echo "\r\033[0m ✅ \n"

%.S.o: %.S
	@echo -n "\033[1;34m 🔧 AS \033[0m$^ => $@"
	@$(AS) $(ASFLAGS) $^ -o $@
	@echo "\r\033[0m ✅ "

%.c.o: %.c
	@echo -n "\033[1;32m 🔧 CC \033[0m$^ => $@"
	@$(CC) $(CFLAGS) -c -o $@ $^
	@echo "\r\033[0m ✅ "

# --- Makefile debug --------------------------------------------------------- #
dumpfs: filesystem.img
	od -A d -c $^

list_kobj:
	@echo $(KERNEL_OBJS)
