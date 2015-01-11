obj-m := m_test.o

BUILD_NUM = 3

ifeq ($(BUILD_NUM),1)	# below is for compiling on Ubuntu-host
  CCPREFIX 		= /home/tomxue/Tom/Source_Code/Raspberry/kernel_compile/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-
  KERNEL_PATH 	= /home/tomxue/Tom/Source_Code/Raspberry/kernel_compile/linux-rpi-3.18.y

all: m_test.c
	make ARCH=arm CROSS_COMPILE=$(CCPREFIX) -C $(KERNEL_PATH) M=$(shell pwd) modules
endif

ifeq ($(BUILD_NUM),2)	# below is for compiling on Pi, using kernel/tools copied from Ubuntu-host
  CCPREFIX 		= /home/pi/tomxue/toolchain/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-
  KERNEL_PATH 	= /lib/modules/$(shell uname -r)/build

all: m_test.c
	make ARCH=arm CROSS_COMPILE=$(CCPREFIX) -C $(KERNEL_PATH) M=$(shell pwd) modules
endif

ifeq ($(BUILD_NUM),3)	# below is for compiling on Pi, using rpi-source downloaded source codes
  KERNEL_PATH 	= /lib/modules/$(shell uname -r)/build

all: m_test.c
	make -C $(KERNEL_PATH) M=$(shell pwd) modules
endif

install:
	sudo insmod m_test.ko
	
uninstall:
	sudo rmmod m_test
	
check:
	dmesg | tail

clean:
	rm -rf *.ko *.o Module.symvers m_test.mod.c modules.order .m_test* .tmp_versions .*.cmd *.swp
	
