MKRESCUE = grub2-mkrescue

image.iso: kernel.bin ramdisk.tar
	@echo -e "\033[1;37mBuilding the ISO...\033[0m"
	@cp kernel.bin iso/boot/kernel.bin
	@cp ramdisk.tar iso/boot/ramdisk.tar
	@$(MKRESCUE) -o image.iso iso 2> /dev/null
