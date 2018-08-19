KERNEL_OBJS =  $(patsubst %.c,%.c.ko,$(shell find $(SOURCE_FOLDER)/kernel -name '*.c'))
KERNEL_OBJS += $(patsubst %.S, %.S.o,$(shell find $(SOURCE_FOLDER)/kernel -name '*.S'))

kernel_build_msg:
	@echo ""
	@echo "Building the kernel..."
	@echo "-------------------------------------------------------------------------------"

kernel.bin: kernel_build_msg $(KERNEL_OBJS) libk.a
	@$(LD) $(LDFLAGS) -T $(SOURCE_FOLDER)/kernel.ld -o $@ $(KERNEL_OBJS) libk.a
	@$(OBJDUMP) -Mintel -S $@ > kernel.asm