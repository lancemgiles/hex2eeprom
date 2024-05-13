#!/bin/bash

# be sure to install srec_cat and ch341eeprom first
# then, add the following to the bottom of .bashrc (located in your home directory)
# alias ch341eeprom='/home/grz/dogmandevices/projects/FV-1/ch341eeprom/ch341eeprom'
# if you don't do this, you will need to uncomment the middle line of the script and change 'ch341eeprom' to './ch341eeprom'

# argument = filename without extention
# convert .hex to .bin > to USB connected EEPROM

# execute from project directory from terminal with sh /path/to/hex2eeprom.sh filename
# or add the following to .bashrc
# alias hex2eeprom='/home/grz/dogmandevices/projects/FV-1/hex2eeprom/hex2eeprom.sh'

srec_cat $1.hex -intel -o $1.bin -binary
# cd /path/to/ch341eeprom
sudo ch341eeprom -s 24c32 -w /home/grz/dogmandevices/projects/FV-1/$1.bin
# be sure to change the target directory to where you want the file to be saved

