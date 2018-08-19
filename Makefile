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
O = -O3

KCFLAGS   += -D __KERNEL -I ./include -ffreestanding $(O) -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb -nostdinc
KCPPFLAGS += -D __KERNEL -I ./include -ffreestanding $(O) -nostdlib -Wall -Wextra -Werror -ggdb -fno-exceptions -fno-rtti

CFLAGS    += -D __USER -I ./include $(O) -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb -nostdinc
CPPFLAGS  += -D __USER -I ./include $(O) -nostdlib -Wall -Wextra -Werror -ggdb -fno-exceptions -fno-rtti

LDFLAGS   += $(O)
ASFLAGS   += -felf32

QEMUFLAGS += -m 256M -serial mon:stdio -cdrom image.iso -M accel=kvm:tcg

include config.mk

# --- Commands --------------------------------------------------------------- #

.PHONY: all
all: image.iso

.PHONY: rebuild
rebuild: clean all

.PHONY: run
run: all
	@echo "Booting qemu..."
	@qemu-system-i386 $(QEMUFLAGS)

.PHONY: run-nox
run-nox: all
	@echo "Booting qemu (nox)..."
	@qemu-system-i386 $(QEMUFLAGS) -nographic

.PHONY: bochs
bochs: all
	bochs

.PHONY: debug
debug: all
	@echo "Booting qemu (debug)..."
	@qemu-system-i386 $(QEMUFLAGS) -s -S

.PHONY: clean
clean:
	@echo ""
	@echo "Cleaning up project folder..."
	@echo "-------------------------------------------------------------------------------"
	find -name "*.o" -delete
	find -name "*.c.o" -delete
	find -name "*.S.o" -delete
	find -name "*.cpp.o" -delete
	find -name "*.c.ko" -delete
	find -name "*.S.ko" -delete
	find -name "*.cpp.ko" -delete
	find -name "*.bin" -delete
	find -name "*.asm" -delete
	find -name "*.img" -delete
	find -name "*.a" -delete
	find -name "*.iso" -delete
	find -name "*.tar" -delete
.PHONY: very-clean
very-clean: clean
	rm -rf ./cross
	rm -rf ./build/tarballs
	rm -rf ./build

.PHONY: toolchain
toolchain:
	cd scripts; ./toolchain.sh

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