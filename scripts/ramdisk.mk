
ramdisk.tar:
	@echo ""
	@echo "Generating on memory file system..."
	@echo "-------------------------------------------------------------------------------"
	@tar -cvf ramdisk.tar -C base $(shell ls base/)
