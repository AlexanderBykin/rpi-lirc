# rpi-lirc
Summary config LIRC `0.10.1-5.2` as Transmitter and Receiver for Raspberry (Raspbian or DietPi) with Kernel 4.19 based on [elmicha comment on 30 May 2019](https://github.com/raspberrypi/linux/issues/2993) 

### Steps to setup:
1) copy all files from this repo to your Raspberry
2) install patched and builded LIRC [as it does here for 4.19 kernel](https://www.raspberrypi.org/forums/viewtopic.php?t=235256) 
```
cd ./lirc-patched
sh ./deps-install.sh
sh ./lirc-install.sh // this will fail it's normal
```
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
- [IR-led circuit](https://github.com/AlexanderShniperson/rpi-lirc/blob/master/led-circuit.png) and connection to Raspberry

### Testing
- open first ssh terminal for Raspberry and run `journalctl -fu lircd`
- open second ssh terminal for Raspberry and run `irsend --device=/var/run/lirc/lircd-tx SEND_ONCE TEST KEY_0`
- success result you should see at your first ssh session

### Inspect IR
To check supported IR and enabled protocols run `sudo ir-keytable`, to enable all possible protocols run `sudo ir-keytable -p all -t -v`

### Known issues
- Send and Receive doesn't work from the same Raspberry device, in my case i tested with Raspberry Zero, but if we use two separate devices it works