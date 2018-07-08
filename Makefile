export PATH := $(shell tools/activate.sh)

KERNEL_OBJS =  $(patsubst %.c,%.c.o,$(shell find ./kernel -name '*.c'))
KERNEL_OBJS += $(patsubst %.S, %.S.o,$(shell find ./kernel -name '*.S'))

TOOLS_PREFIX = i686-elf-
CC = $(TOOLS_PREFIX)gcc
AS = nasm
OBJDUMP = $(TOOLS_PREFIX)objdump

CFLAGS  = -I ./include -ffreestanding -nostdlib -O3 -std=gnu11 -Wall -Wextra -Werror -ggdb
LDFLAGS = -I ./include -ffreestanding -nostdlib -O3 -lgcc -ggdb
ASFLAGS = -felf32

QEMUFLAGS = -M accel=kvm:tcg -m 256M  -display sdl -serial mon:stdio -kernel kernel.bin

# --- Commands --------------------------------------------------------------- #
.PHONY: build rebuild run run-nox debug clean crosscompiler

build: kernel.bin

rebuild: clean build

run: build
	qemu-system-i386 $(QEMUFLAGS)

run-nox: build
	qemu-system-i386 $(QEMUFLAGS) -nographic

debug: build
	qemu-system-i386 $(QEMUFLAGS) -s -S

clean:
	@echo "Cleaning up source tree..."
	find -name "*.o" -delete
	find -name "*.bin" -delete
	find -name "*.asm" -delete

crosscompiler:
	./buildtoolchain.sh

# --- Makefile debug --------------------------------------------------------- #

kernel.bin: $(KERNEL_OBJS)
	$(CC) $(LDFLAGS) -T kernel/kernel.ld -o $@ $^
	$(OBJDUMP) -S $@ > kernel.asm

%.S: %.pl
	perl $^ > $@

%.S.o: %.S
	@echo "  AS  $@ -> $^"
	@$(AS) $(ASFLAGS) $^ -o $@

%.c.o: %.c
	@echo "  CC  $@ -> $^"
	@$(CC) $(CFLAGS) -c -o $@ $^

# --- Makefile debug --------------------------------------------------------- #

list_kobj:
	@echo $(KERNEL_OBJS)
