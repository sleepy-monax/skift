export PATH := $(shell tools/activate.sh)

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
	@echo -n "\n\033[1;37m .. Cleaning up Source tree...\033[0m"
	@find -name "*.o" -delete
	@find -name "*.c.o" -delete
	@find -name "*.S.o" -delete
	@find -name "*.bin" -delete
	@find -name "*.asm" -delete
	@find -name "*.img" -delete
	@find -name "*.a" -delete
	@echo "\r\033[0m ✅\n"

very-clean: check_clean clean
	rm -rf ./cross
	rm -rf ./tools/tarballs
	rm -rf ./tools/build

check_clean:
	@echo -n "Are you sure? (Because you would need to rebuild... GCC 😱 )" && read ans && [ $$ans == y ]

crosscompiler:
	./tools/buildtoolchain.sh

include tools/common.mk scripts/*.mk


# --- Makefile debug --------------------------------------------------------- #
dumpfs: filesystem.img
	od -A d -c $^

list_kobj:
	@echo $(KERNEL_OBJS)

.PHONY: build rebuild run run-nox debug clean crosscompiler