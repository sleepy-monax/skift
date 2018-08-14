KERNEL_OBJS =  $(patsubst %.c,%.c.ko,$(shell find $(SOURCE_FOLDER)/kernel -name '*.c'))
KERNEL_OBJS += $(patsubst %.S, %.S.o,$(shell find $(SOURCE_FOLDER)/kernel -name '*.S'))
KERNEL_OBJS += $(patsubst %.cpp, %.cpp.ko,$(shell find $(SOURCE_FOLDER)/kernel -name '*.cpp'))

kernel.bin: $(KERNEL_OBJS) libk.a
	@echo -e -n "\n\033[1;37m 🔧 Linking the kernel.\033[0m"
	@$(LD) $(LDFLAGS) -T $(SOURCE_FOLDER)/kernel.ld -o $@ $^
	@$(OBJDUMP) -Mintel -S $@ > kernel.asm
	@echo -e "\r\033[0m ✅ "