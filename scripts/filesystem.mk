filesystem.img:
	@echo -n "\n\033[1;37m .. Generating the file system.\033[0m"
	@dd if=/dev/zero of=$@ count=10000 status=none
	@echo "\r\033[0m ✅ "