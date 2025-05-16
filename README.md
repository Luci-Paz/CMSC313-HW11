# CMSC313-HW11: 
Solution code for CMSC313 HW11

## Author:
Lucian Pazour (UMBC / CMSC313-01, MoWe 8:30AM - 9:45AM / 05152025)

---

## What The Program Does
The program takes an input of different hexidecimal numbers and displays the hexidecimal digits as ascii characters.   
- The input is predefined in the program with the memory location labelled as `inputBuf` and the information is stored as bytes

<br>

### What Should You See When Run:
The current input is 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A   

<br>

Running the executable will result in the following output:
```
$ ./hw11translate2Ascii
83 6A 88 DE 9A C3 54 9A
```
---

<br>

## Build Instructions
**There are two builds for the project, these are **release** and **debug****

**1. The basic/release build will compile and link the program without any debug information. It can be run with the following commands:**
```
$ make
```
or
```
$ make release
```
- These will create the object and executable files for the project without debug information

<br>

**2. The debug build with compile and  link the program with debug information. It can be run with the following command:**
```
$ make debug
```
- This will create the object and executable files for the project with debug information

<br>

**To clean the compiled code, run the following command:**
```
$ make clean
```
- This will remove the object and executable file
---

<br>

## Expected Files After Compilation
After compiling the code using the make builds, you should have six files:
| File Name      | Description |
|----------------|-------------|
| LICENSE              | Description of the license used for this project |
| Makefile             | Automates the build process for the program |
| README.md            | File that describes the program, how it works and how to use it |
| hw11translate2Ascii  | Executable for the program |
| hw11translate2Ascii.asm | Program file that has the assembly code |
| hw11translate2Ascii.o | Object file for the program |






