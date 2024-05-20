#!/bin/bash

# nextboot.sh - Reboots the system with the specified boot loader entry

win_boot_id=0001
sb=0003
uki=0002

function next_boot() {
    if [ "$#" -eq 0 ]; then
        #sudo systemctl reboot --boot-loader-entry=archwayland.conf
        sudo efibootmgr | grep -Po "BootOrder.*|Boot\d{4}\*\s(\w{4,}\s)+" | bat -pl less --theme=TwoDark
    fi
    if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
        echo "Usage: nextboot.sh [OPTIONS] BOOT_LOADER_ENTRY"
        echo "Reboots the system with the specified boot loader entry."
        echo
        echo "Options:"
        echo -l , --list List available boot loader entries
        echo -h , --help Show this help message
        echo efi Reboots in UEFI interface
        echo windows reboots to configured windows bootid - $winbooid
        return 0
    fi
    if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
        sudo efibootmgr | grep -Po "BootOrder.*|Boot\d{4}\*\s(\w{4,}\s)+" | bat -pl less --theme=TwoDark

        if [ "$?" == 1 ]; then
            . ~/.bash_functions
            error "Failed to list boot loader entries."
            error "Does the path exsist?"
            return 1
        fi
        return 0
    elif [ "$1" == "efi" ]; then
        sudo bootctl reboot-to-firmware true
        bootid="efi"
    elif [ "$1" == "windows" ]; then
        bootid=0001
        sudo efibootmgr --bootnext 0001 >/dev/null 2>&1
    else
        bootid="$1"
        sudo efibootmgr --bootnext "$1" >/dev/null 2>&1
    fi
    if [ $? -eq 0 ]; then
        if [ "$bootid" == "efi" ]; then
            bootlabel="EFI Firmware"
        else
            bootlabel=$(efibootmgr | grep Boot$bootid | sed -E 's/Boot.....?.?(.*)HD.*/\1/g')
        fi
        echo -e "\033[32mSelected $bootid - $bootlabel\033[0m"
        echo "Reboot now? [Y/n]: "
        read answer
        if [[ $answer =~ ^[Yy]?$|^$ ]]; then
            if [[ -f ~/scripts/shutdown/force_kill.sh ]]; then
                ~/scripts/shutdown/force_kill.sh
            fi
            sudo /usr/bin/systemctl reboot
        else
            echo -e "\033[33mNext boot set - $bootlabel\033[0m"
            return 0
        fi
    else
        echo -e "\033[31mError: Invalid number of arguments. Use --help for usage information.\033[0m"
        return 1
    fi
}

next_boot "$@"
