
ramdisk.tar:
	@echo "Generating the ramdisk..."
	@tar -cvf ramdisk.tar -C base $(shell ls base/)
