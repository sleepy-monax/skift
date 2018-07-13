export PATH := $(shell tools/activate.sh)

KERNEL_OBJS =  $(patsubst %.c,%.c.o,$(shell find ./kernel -name '*.c'))
KERNEL_OBJS += $(patsubst %.S, %.S.o,$(shell find ./kernel -name '*.S'))

TOOLS_PREFIX = i686-elf-
CC = $(TOOLS_PREFIX)gcc
AS = nasm
OBJDUMP = $(TOOLS_PREFIX)objdump

CFLAGS  = -I ./include -ffreestanding -O3 -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb
LDFLAGS = -I ./include -ffreestanding -O3 -nostdlib -lgcc -ggdb
ASFLAGS = -felf32

QEMUFLAGS = -m 256M -display sdl -serial mon:stdio -kernel kernel.bin -M accel=tcg

# --- Commands --------------------------------------------------------------- #
.PHONY: build rebuild run run-nox debug clean crosscompiler

build: kernel.bin

rebuild: clean build

run: build
	@echo "\n\033[1;37mBooting qemu...\033[0m\n"
	@qemu-system-i386 $(QEMUFLAGS) -nographic

run-x: build
	@echo "\033[1;37mBooting qemu...\033[0m"
	@qemu-system-i386 $(QEMUFLAGS) 

debug: build
	@qemu-system-i386 $(QEMUFLAGS) -s -S

clean:
	@echo -n "\n\033[1;37mCleaning up Source tree...\033[0m"
	@find -name "*.o" -delete
	@find -name "*.c.o" -delete
	@find -name "*.S.o" -delete
	@find -name "*.bin" -delete
	@find -name "*.asm" -delete
	@echo "\033[1;37m DONE\033[0m\n"

crosscompiler:
	./buildtoolchain.sh

# --- Makefile debug --------------------------------------------------------- #

kernel.bin: $(KERNEL_OBJS)
	@echo -n "\n\033[1;37mLinking the kernel...\033[0m"
	@$(CC) $(LDFLAGS) -T kernel/kernel.ld -o $@ $^
	@$(OBJDUMP) -S $@ > kernel.asm
	@echo "\033[1;37m DONE\033[0m\n"

%.S.o: %.S
	@echo -n "\033[1;34m .. AS \033[0m$^ => $@"
	@$(AS) $(ASFLAGS) $^ -o $@
	@echo "\r\033[1;37m OK \033[0m"

%.c.o: %.c
	@echo -n "\033[1;32m .. CC \033[0m$^ => $@"
	@$(CC) $(CFLAGS) -c -o $@ $^
	@echo "\r\033[1;37m OK \033[0m"

# --- Makefile debug --------------------------------------------------------- #

list_kobj:
	@echo $(KERNEL_OBJS)
