#!/bin/python3

import os
import subprocess
from getpass import getpass

def printChoices():
    print("1.) VSCode")
    print("2.) PowerShell")
    print("3.) Steam")
    print("4.) Blender")
    print("5.) Krita")
    print("6.) VLC")
    print("7.) Tilix")
    print("8.) Mozilla VPN")
    print("9.) xxd")
    print("10.) Zenity")
    print("11.) Virt Manager")
    print("12.) Zoom")
    print("Enter 'a' to install all programs")
    print("Enter q to quit")
    return input("\nChoice: ")

def chmod_scripts(script_name, exe_symb):
    subprocess.run(["chmod", exe_symb+"x", "install_"+script_name+".sh"])

def make_install_scripts_executable():
    chmod_scripts("vscode", "+")
    chmod_scripts("powershell", "+")
    chmod_scripts("steam", "+")
    chmod_scripts("blender", "+")
    chmod_scripts("krita", "+")
    chmod_scripts("vlc", "+")
    chmod_scripts("tilix", "+")
    chmod_scripts("mozillavpn", "+")
    chmod_scripts("xxd", "+")
    chmod_scripts("zenity", "+")
    chmod_scripts("virt-manager", "+")
    chmod_scripts("flathub_repo", "+")
    chmod_scripts("zoom", "+")

    print("System is ready to start installing your programs...")
    subprocess.run(["sleep", "3"])
    subprocess.run(["clear"])

def do_install(prog_name, passwd):
    subprocess.run(["./install_"+prog_name+".sh", passwd])

def print_choice(choice_name):
    print("You have chosen to install " + choice_name + "...")

def menu():
    print("Setting things up...")
    passwd = getpass()
    answer = ''
    make_install_scripts_executable()
    print("Installing flatpak and the flathub repo...\n")
    do_install("flathub_repo", passwd)

    while answer != 'q':
        subprocess.run(["clear"])
        print('Select the program to install: \n')
        answer = printChoices()

        match answer:
            case "1":
                print_choice("VSCode")
                do_install("vscode", passwd)
            case "2":
                print_choice("PowerShell")
                do_install("powershell", passwd)
            case "3":
                print_choice("Steam")
                do_install("steam", passwd)
            case "4":
                print_choice("Blender")
                do_install("blender", passwd)
            case "5":
                print_choice("Krita")
                do_install("krita", passwd)
            case "6":
                print_choice("VLC")
                do_install("vlc", passwd)
            case "7":
                print_choice("Tilix")
                do_install("tilix", passwd)
            case "8":
                print_choice("Mozilla VPN")
                do_install("mozillavpn", passwd)
            case "9":
                print_choice("xxd")
                do_install("xxd", passwd)
            case "10":
                print_choice("Zenity")
                do_install("zenity", passwd)
            case "11":
                print_choice("Virt-Manager")
                do_install("virt-manager", passwd)
            case "12":
                print_choice("Zoom")
                do_install("zoom", "") # Send an empty string as a password since flatpak installs don't need a password
            case "a":
                print_choice("all programs on the list")
                do_install("vscode", passwd)
                do_install("powershell", passwd)
                do_install("steam", passwd)
                do_install("krita", passwd)
                do_install("blender", passwd)
                do_install("vlc", passwd)
                do_install("tilix", passwd)
                do_install("mozillavpn", passwd)
                do_install("xxd", passwd)
                do_install("zenity", passwd)
                do_install("virt-manager", passwd)
                do_install("zoom", "")
            case "q":
                subprocess.run(["clear"])
                print("Cleaning up system...")
                chmod_scripts("vscode", "-")
                chmod_scripts("powershell", "-")
                chmod_scripts("steam", "-")
                chmod_scripts("blender", "-")
                chmod_scripts("krita", "-")
                chmod_scripts("vlc", "-")
                chmod_scripts("tilix", "-")
                chmod_scripts("mozillavpn", "-")
                chmod_scripts("xxd", "-")
                chmod_scripts("zenity", "-")
                chmod_scripts("virt-manager", "-")
                chmod_scripts("flathub_repo", "-")
                chmod_scripts("zoom", "-")

                print("Quitting...\n")
            case _:
                print('Invalid choice!')
                
        subprocess.run(["sleep", "3"])

menu()    
