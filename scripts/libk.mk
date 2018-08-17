KLIBC_OBJS = $(patsubst %.c,%.c.ko,$(shell find $(SOURCE_FOLDER)/libc -name '*.c'))

libk_build_msg:
	@echo ""
	@echo "Building the kernel's libc..."
	@echo "-------------------------------------------------------------------------------"

libk.a: libk_build_msg $(KLIBC_OBJS)
	@$(AR) rcs $@ $(KLIBC_OBJS)