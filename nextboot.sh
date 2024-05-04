#!/bin/bash

# nextboot.sh - Reboots the system with the specified boot loader entry

function next_boot() {
    if [ "$#" -eq 0 ]; then
        systemctl reboot --boot-loader-entry=archwayland.conf
    fi
    if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
        echo "Usage: nextboot.sh [OPTIONS] BOOT_LOADER_ENTRY"
        echo "Reboots the system with the specified boot loader entry."
        echo
        echo "Options:"
        echo      -l , --list      List available boot loader entries
        echo      -h , --help      Show this help message
        echo      --efi           Reboots in UEFI interface
        return 0
    fi
    if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
        efibootmgr | grep -Po "BootOrder.*|Boot\d{4}\*\s(\w{4,}\s)+" | bat -pl less

        if [ "$?" == 1 ]; then
            . ~/.bash_functions
            error "Failed to list boot loader entries."
            error "Does the path exsist?"
            return 1
        fi
        return 0
    elif [ "$1" == "--efi" ]; then
        systemctl reboot --firmware-setup

    elif [ "$#" -eq 1 ]; then
    	efibootmgr --bootnext $1 >/dev/null
    	answer=$(read "Reboot now? [Y/n]: ")
	if [ $answer == "y"]; then
    	  sleep 2
          systemctl reboot
	elif [ $answer == '']; then
          sleep 2
          systemctl reboot
	else
	  echo "Ok"
	fi
        return 0
    else
        echo "Error: Invalid number of arguments. Use --help for usage information."
        return 1
    fi
}

next_boot "$@"

