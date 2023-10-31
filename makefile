#@copyright : youssef
CC=arm-none-eabi-
CFLAGS=-mcpu=arm926ej-s
INCS=-I .
LIBS=
SRC =$(wildcard *.c)
OBJ = $(SRC:.c=.o)
As =$(wildcard *.s)
AsOBJ =$(As:.s=.o)
Project_Name =learn-in-depth


all:$(Project_Name).bin
	@echo "=========Build Is Done=========="	

startup.o:startup.s
	$(CC)as.exe $(CFLAGS) $< -o $@ 2> log

%.o: %.c
	$(CC)gcc.exe -c -g $(INCS) $(CFLAGS) $@ -o $@

$(Project_Name).elf: $(OBJ) $(AsOBJ)
	$(CC)ld.exe -T linker_script.ld $(LIBS)  $(OBJ) $(AsOBJ) -o $@ -Map=Map_file.map

$(Project_Name).bin: $(Project_Name).elf
	$(CC)objcopy.exe -O binary $< $@

clean_all: 
	rm *.o *.bin *.elf

clean: 
	rm *.bin *.elf