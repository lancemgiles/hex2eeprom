# hex2eeprom

Write a .hex file to USB-connected EEPROM from the Linux terminal

## Background

This is a script used for taking the output from [SpinASM](http://www.spinsemi.com/products.html) builds (in .hex format), converts the .hex file into a .bin file (with `srec_cat`), and finally writes the .bin file to the USB connected 24CXX serial EEPROM  and CH341A IC (using [ch341eeprom](https://github.com/command-tab/ch341eeprom)).
This has been tested on Linux Mint, Fedora, and Arch Linux.

It is a very short script, but when going through various code changes in your SpinASM project, it is nice only needing to execute one command rather than a few. This makes it much simpler to write some code, test it, edit the code, and test again.

## Setup
First, make sure that both `srec_cat` and `ch341eeprom` are installed.
Search online for your distrubtion's version of `srec_cat` as it should be in an official repo or the AUR.
Note where the `ch341eeprom` installation folder is, as you will need to update the script with the file's location.
(I tried making an alias and a bash function for this and ultimately decided it will be easier for everyone to just use the full file path, as alias do not work outside of the interactive shell).
Be sure to follow the instructions on github to properly install `ch341eeprom`.

To install `hex2eeprom`, simply clone this repository, or download it as a `.zip`. Note where you save this file. For convience, it is best to alias. Open `.bashrc` from your user's `home` directory and add the following:
`alias hex2eeprom='/path/to/hex2eeprom.sh'`
Otherwise, you will need to either run the script from the directory where the script lives, or call the entire file path.

After adding the alias, make sure to run `source ~/.bashrc` or logout and log back in.

### Change directory locations to suit your local machine

In the second line of code, change the directory to where you installed `ch341eeprom`. Keep in mind that this is just to the directory where the executable lives, not the executable itself

In the final line of un-commented code, replace directory with the name of your working directory for SpinASM projects.

Save these changes.

## How to Use

Follow usual procedures to build a `.hex` file using SpinASM. Make a note of where the file is saved. It is recommended to have a directory dedicated to working on these projects.

Open your terminal emulator of choice and navigate to the directory where you saved the `.hex` file (using the `cd` command or locate it in a file explorer, right click and select "open in terminal").

Run the following command:

`sh /LOCATION/OF/hex2eeprom/hex2eeprom.sh FILENAME` with the location of your `hex2eeprom.sh` file and the name of your `.hex` file WITHOUT the `.hex` part written out. If you have aliased the script, you can just run `hex2eeprom FILENAME`. If you do not want run the command from the directory of the `.hex` file, then use the full file path.

After the initial setup, as long as the device you are writing to is connected and powered on, that is all you need to do to take a DSP project built with SpinASM and put it on a physical device.
