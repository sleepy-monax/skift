ULIBC_OBJS = $(patsubst %.c,%.c.o,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libu.a: $(ULIBC_OBJS)
	@echo -e -n "\n\033[1;37m 🔧 Linking the user libc.\033[0m"
	@$(AR) rcs $@ $^
	@echo -e "\r\033[0m ✅ "