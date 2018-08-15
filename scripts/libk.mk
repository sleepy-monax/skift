KLIBC_OBJS = $(patsubst %.c,%.c.ko,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libk.a: $(KLIBC_OBJS)
	@echo "Linking the kernel libc..."
	@$(AR) rcs $@ $^