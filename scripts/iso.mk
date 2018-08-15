MKRESCUE = grub-mkrescue

image.iso: kernel.bin ramdisk.tar
	@echo "Building the ISO..."
	@cp kernel.bin iso/boot/kernel.bin
	@cp ramdisk.tar iso/boot/ramdisk.tar
	@$(MKRESCUE) -o image.iso iso 2> /dev/null
