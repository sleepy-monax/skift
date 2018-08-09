
ramdisk.tar:
	@echo " .. Generating ramdisk"
	tar -cvf ramdisk.tar -C base $(shell ls base/)
