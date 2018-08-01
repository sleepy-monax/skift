KLIBC_OBJS = $(patsubst %.c,%.c.ko,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libk.a: $(KLIBC_OBJS)
	@echo -n "\n\033[1;37m 🔧 Linking the kernel libc.\033[0m"
	@$(AR) rcs $@ $^
	@echo "\r\033[0m ✅ "