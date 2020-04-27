#!/bin/bash

cp ./71-lirc.rules /etc/udev/rules.d/

cp ./lircd.service /lib/systemd/system/
cp ./lircd-tx.service /lib/systemd/system/
cp ./lircd-tx.socket /lib/systemd/system/

cp ./lircd.conf /etc/lirc/
cp ./test.lircd.conf /etc/lirc/lircd.conf.d/

cp ./lirc_options.conf /etc/lirc/
cp ./lirc_tx_options.conf /etc/lirc/

systemctl enable lircd
systemctl enable lircd-tx.service
systemctl enable lircd-tx.socket