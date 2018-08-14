
ramdisk.tar:
	@echo -e "\033[1;37mGenerating the ramdisk...\033[0m"
	@tar -cvf ramdisk.tar -C base $(shell ls base/)
