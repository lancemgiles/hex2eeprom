#!/bin/bash

# argument = filename without extention
# convert .hex to .bin > to USB connected EEPROM
# execute from project directory from terminal with sh /home/greze/FV-1/hex2eeprom/hex2eeprom.sh filename

srec_cat $1.hex -intel -o $1.bin -binary
cd /home/greze/FV-1/ch341eeprom-master
sudo ./ch341eeprom -s 24c32 -w /home/greze/FV-1/$1.bin

