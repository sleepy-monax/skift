image.iso: kernel.bin ramdisk.tar
	cp kernel.bin iso/boot/kernel.bin
	cp ramdisk.tar iso/boot/ramdisk.tar
	grub2-mkrescue -o image.iso iso