# rpi-lirc
Summary config LIRC as Transmitter and Receiver for Raspberry (Raspbian or DietPi) with Kernel 4.19 based on [elmicha comment on 30 May 2019](https://github.com/raspberrypi/linux/issues/2993) 

### Steps to setup:
1) install LIRC at your Raspberry with `sudo apt-get install lirc`
2) copy all files from this repo to your Raspberry
3) run `sh lirc-setup.sh` to copy all files at needed destination
4) add two lines into `/boot/config.txt` or `/DietPi/config.txt`
```
dtoverlay=gpio-ir,gpio_pin=17
dtoverlay=pwm-ir-tx,gpio_pin=18
```
5) reboot

### Instruction to wire
- Your IR-receiver signal pin should be connected into GPIO-17
- Your IR-transmitter should be connected into GPIO-18

### Testing
- open first ssh terminal for Raspberry and run `journalctl -fu lircd`
- open second ssh terminal for Raspberry and run `irsend --device=/var/run/lirc/lircd-tx SEND_ONCE TEST KEY_0`
- success result you should see at your first ssh session

### Patched LIRC
In `lirc-patched` directory you can find already patched and builded LIRC [as it does here for 4.19 kernel](https://www.raspberrypi.org/forums/viewtopic.php?t=235256)
```
cd ./lirc-patched
sudo apt remove lirc liblirc0 liblirc-client0
sudo apt install ./liblirc0_0.10.1-5.2_armhf.deb ./liblirc-client0_0.10.1-5.2_armhf.deb ./lirc_0.10.1-5.2_armhf.deb
```

### Inspect IR
To check supported IR and enabled protocols run `sudo ir-keytable`, to enable all possible protocols run `sudo ir-keytable -p all -t -v`