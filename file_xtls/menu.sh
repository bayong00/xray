#!/bin/bash
clear
# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'

## GET CONTENT##
#
otps=$(cat /usr/local/premium-vps/rioxy)
tglnow=$(date "%Y-%m-%d")
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx=$(systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

#systm status Service
if [[ $nginx == "run" ]]; then
   status_nginx="${RED}Not Active${NC}"
else
   status_nginx="${GREEN}Online${NC}"
    fi
if [[ $xray == "run" ]]; then 
   status_xray="${RED}Not Active${NC}"
else
   status_xray=" ${GREEN}Online${NC} "
   fi
# END GET CONTENT ##

#function menu
function verifystat(){
    echo -e "Verifikasi .."
    sleep 2
    if [[ $otps =="rioxy"]]; then
       echo -e "terverifikasi"
    else
       echo -e "belum terverikasi"
       fi
}
function outlineMenu(){
    echo -e "πππππππππππππππππππππππππππππππππππππππππ" 
}
function inlineMenu(){
    echo -e "¶---------------------------------------¶"
}
function lineX(){
    echo -e "¶xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx¶"
}

function menuList(){
    outlineMenu
    echo -e "¶ ∆ Service: "
    echo -e "¶   # Nginx [${status_nginx}]"
    echo -e "¶   # XRAY  [${status_xray}]"
    inlineMenu
    echo -e "¶             ∆ XRAY MENU ∆             ¶"
    echo -e "¶ ∆ INFORMASI SERVER"
    echo -e "¶   # MODEL  : "
    echo -e "¶   # RAM    : "
    echo -e "¶   # ISP    : "
    echo -e "¶   # IP     : "
    echo -e "¶   # DOMAIN : "   
    inlineMenu
    echo -e "¶  1. Vmess "
    echo -e "¶  2. Vless "
    echo -e "¶  3. Trojan "
    echo -e "¶  4. Shadowsock "
    echo -e "¶  5. Setting "
    echo -e "¶  6. speedtest"
    echo -e "¶  7. reboot "
    echo -e "¶  8. Exit "
    #running menu
    read -p "  Pilih dari [1-8]: " menu
    
    case $menu in
    1)
    verifystat
    clear
    mVmess
    ;;
    2)
    verifystat
    clear
    mVless
    ;;
    3)
    verifystat
    clear
    mTrojan
    ;;
    4)
    verifystat
    clear
    mSS
    ;;
    5)
    verifystat
    clear
    meSets
    ;;
    6)
    verifystat
    clear
    speedtest
    ;;
    7)
    reboot
    exit
    ;;
    8)
    clear
    exit
    ;;
    *)
    clear
    menuList
    ;;
    esac
}

### menu vmess ###
function mVmess(){
    outlineMenu
    echo -e "¶             ∆ Vmess ∆             ¶"
    inlineMenu
    echo -e "¶  Vmess include (ws,grpc / 443 & 80)"
    echo -e "¶  1. add (+)"
    echo -e "¶  2. remove (-)"
    echo -e "¶  3. renew (++)"
    echo -e "¶  4. trial (one day)"
    echo -e "¶  5. cek user login (?)"
    read -p "¶  pilih" pilihVm
    case $pilihVm in
    1)
    clear
    addVmess
    ;;
    2)
    delVmess
    ;;
    3)
    clear
    editVmess
    ;;
    4)
    clear
    trialVm
    ;;
    5)
    clear
    cekVmess
    ;;
    *)
    clear
    menuList
    ;;
    esac
}

### menu vless ###
function mVless(){
    outlineMenu
    echo -e "¶             ∆ Vless ∆             ¶"
    inlineMenu
    echo -e "¶  Vless include (ws,grpc / 443 & 80"
    echo -e "¶  1. add (+)"
    echo -e "¶  2. remove (-)"
    echo -e "¶  3. renew (++)"
    echo -e "¶  4. trial (one day)"
    echo -e "¶  5. cek user login (?)"
    read -p "¶  pilih" pilihVl
    case $pilihVl in
    1)
    clear
    addVless
    ;;
    2)
    delVless
    ;;
    3)
    clear
    editVless
    ;;
    4)
    clear
    trialVl
    ;;
    5)
    clear
    cekVless
    ;;
    *)
    clear
    menuList
    ;;
    esac
}
### menu trojan ###
function mTrojan(){
    outlineMenu
    echo -e "¶             ∆ Trojan ∆             ¶"
    inlineMenu
    echo -e "¶  Trojan include (ws,grpc / 443 & 80"
    echo -e "¶  1. add (+)"
    echo -e "¶  2. remove (-)"
    echo -e "¶  3. renew (++)"
    echo -e "¶  4. trial (one day)"
    echo -e "¶  5. cek user login (?)"
    read -p "¶  pilih" pilihTr
    case $pilihTr in
    1)
    clear
    addTrojan
    ;;
    2)
    delTrojan
    ;;
    3)
    clear
    editTrojan
    ;;
    4)
    clear
    trialTrojan
    ;;
    5)
    clear
    cekTrojan
    ;;
    *)
    clear
    menuList
    ;;
    esac
}

### menu shadow ###
function mSS(){
    outlineMenu
    echo -e "¶             ∆ Shadowsock ∆             ¶"
    inlineMenu
    echo -e "¶  Shadowsock include (ws,grpc / 443 & 80)"
    echo -e "¶  1. add (+)"
    echo -e "¶  2. remove (-)"
    echo -e "¶  3. renew (++)"
    echo -e "¶  4. trial (one day)"
    echo -e "¶  5. cek user login (?)"
    read -p "¶  pilih" pilihSs
    case $pilihSs in
    1)
    clear
    addSs
    ;;
    2)
    delSs
    ;;
    3)
    clear
    editSs
    ;;
    4)
    clear
    trialSs
    ;;
    5)
    clear
    cekSs
    ;;
    *)
    clear
    menuList
    ;;
    esac
}
function {
    
}
#end Menu



