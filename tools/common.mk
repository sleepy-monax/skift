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

%.S.o: %.S
	@echo -n "\033[1;34m 🔧 AS \033[0m$^ => $@"
	@$(AS) $(ASFLAGS) $^ -o $@
	@echo "\r\033[0m ✅ "

%.c.o: %.c
	@echo -n "\033[1;32m 🔧 CC \033[0m$^ => $@"
	@$(CC) $(CFLAGS) -c -o $@ $^
	@echo "\r\033[0m ✅ "