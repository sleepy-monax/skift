ULIBC_OBJS = $(patsubst %.c,%.c.o,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libu.a: $(ULIBC_OBJS)
	@echo "Linking the user libc..."
	@$(AR) rcs $@ $^