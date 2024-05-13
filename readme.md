# hex2eeprom

Write a .hex file to USB-connected EEPROM from the Linux terminal

## Background

This is a script used for taking the output from [SpinASM](http://www.spinsemi.com/products.html) builds (in .hex format), converts the .hex file into a .bin file (with `srec_cat`), and finally writes the .bin file to the USB connected 24CXX serial EEPROM  and CH341A IC (using [ch341eeprom](https://github.com/command-tab/ch341eeprom)). This has only been tested on a Linux Mint machine.

It is a very short script, but when going through various code changes in your SpinASM project, it is nice only needing to execute one command rather than a few.

## Setup
First, make sure that both `srec_cat` and `ch341eeprom` are installed. Note where the `ch341eeprom` installation folder is.
To use the script with minimal changes, open `.bashrc` from your home directory and add the following:
`alias ch341eeprom='/path/to/ch341eeprom'`
This will allow you to run `ch341eeprom` without needing the full filepath. Please note that this path should be to the compiled program and not just the directory that the program lives in.

To install `hex2eeprom`, simply clone this repository, or copy and paste the information found in `hex2eeprom.sh` in this repository. Note where you save this file. For convience, it is best to alias this as well. Open `.bashrc` and add the following:
`alias hex2eeprom='/path/to/hex2eeprom.sh'`
Otherwise, you will need to either run the script from the directory where the script lives, or call the entire file path.

### Change directory locations to suit your local machine

In the second line of code, if you have no aliased ch341eeprom, add the following to the second line:
`cd /path/to/ch341eepom` keeping in mind that this is just to the directory where the executable lives. 

In the final line of un-commented code, replace `/home/greze/FV-1` with the name of your working directory for SpinASM projects.

Save these changes.

## How to Use

Follow usual procedures to build a `.hex` file using SpinASM. Make a note of where the file is saved. It is recommended to have a directory dedicated to working on these projects.

Open your terminal emulator of choice and navigate to the directory where you saved the `.hex` file (using the `cd` command or locate it in a file explorer, right click and select "open in terminal").

Run the following command:

`sh /LOCATION/OF/hex2eeprom/hex2eeprom.sh FILENAME` with the location of your `hex2eeprom.sh` file and the name of your `.hex` file WITHOUT the `.hex` part written out. If you have aliased the script, you can just run `hex2eeprom FILENAME`

After the initial setup, as long as the device you are writing to is connected and powered on, that is all you need to do to take a DSP project built with SpinASM and put it on a physical device.
