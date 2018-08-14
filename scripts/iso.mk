MKRESCUE = grub-mkrescue

image.iso: kernel.bin ramdisk.tar
	cp kernel.bin iso/boot/kernel.bin
	cp ramdisk.tar iso/boot/ramdisk.tar
	$(MKRESCUE) -o image.iso iso