ULIBC_OBJS = $(patsubst %.c,%.c.o,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libu.a: $(ULIBC_OBJS)
	@echo -n "\n\033[1;37m 🔧 Linking the user libc.\033[0m"
	@$(AR) rcs $@ $^
	@echo "\r\033[0m ✅ "