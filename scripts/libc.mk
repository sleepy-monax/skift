LIBC_OBJS = $(patsubst %.c,%.c.o,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libc.a: $(LIBC_OBJS)
	@echo -n "\n\033[1;37m 🔧 Linking the libc.\033[0m"
	@$(AR) rcs $@ $^
	@echo "\r\033[0m ✅ "