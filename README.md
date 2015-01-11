# Kernel_GPIO_interrupt
to show how to trigger GPIO interrupt and do something, on Raspberry Pi

Reference:
    The 1st commit is from link: 
        http://morethanuser.blogspot.tw/2013/04/raspberry-pi-gpio-interrupts-in-kernel.html

    And to achieve 'reboot', I refer to this link:
        http://stackoverflow.com/questions/9728413/how-to-soft-reboot-from-a-non-monolithic-kernel-module-in-an-irq-scope


Run:
    pi@raspberrypi:~/workspace/test$ sudo insmod m_test.ko 
    pi@raspberrypi:~/workspace/test$ dmesg | tail
    ...
    [  257.194505] Hello!
    [  257.194541] Mapped int 187

