#!/bin/bash

# be sure to install srec_cat and ch341eeprom first
# search online for what package srec_cat is part of for your distribution.
# be sure to follow the instruction on github to properly install ch341eeprom

# argument = filename without extention
# convert .hex to .bin > to USB connected EEPROM

# execute from project directory from terminal with sh /path/to/hex2eeprom.sh filename
# or add the following to .bashrc
# alias hex2eeprom='/path/to/hex2eeprom.sh'

srec_cat $1.hex -intel -o $1.bin -binary
cd /home/grz/dogmandevices/projects/FV-1/ch341eeprom
sudo ./ch341eeprom -s 24c32 -w /home/grz/dogmandevices/projects/FV-1/$1.bin
# be sure to change the ch341eeprom directory location to match your system
# be sure to change the target directory to where you want the file to be saved

