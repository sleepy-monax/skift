image.iso: kernel.bin ramdisk.tar
	@echo ""
	@echo "Generating boot ISO..."
	@echo "-------------------------------------------------------------------------------"
	@cp kernel.bin iso/boot/kernel.bin
	@cp ramdisk.tar iso/boot/ramdisk.tar
	@grub-mkrescue -o image.iso iso 2> /dev/null || (echo "'grub-mkrescue' not found!" && echo " -> Falling back to 'grub2-mkrescue'..." && grub2-mkrescue -o image.iso iso 2> /dev/null)
