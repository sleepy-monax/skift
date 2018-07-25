SOURCE_FOLDER = ./source

TOOLS_PREFIX = i686-elf-
CC = $(TOOLS_PREFIX)gcc
AR = $(TOOLS_PREFIX)ar
LD = $(TOOLS_PREFIX)ld
AS = nasm
OBJDUMP = $(TOOLS_PREFIX)objdump

CFLAGS  = -I ./include -ffreestanding -O2 -nostdlib -std=gnu11 -Wall -Wextra -Werror -ggdb
CPPFLAGS  = -I ./include -ffreestanding -O2 -nostdlib -Wall -Wextra -Werror -ggdb -fno-exceptions -fno-rtti
LDFLAGS = -O2
ASFLAGS = -felf32
QEMUFLAGS = -m 256M -display sdl -serial mon:stdio -kernel kernel.bin -M accel=kvm:tcg
QEMUFLAGS += -drive file=filesystem.img,index=0,media=disk,format=raw

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
