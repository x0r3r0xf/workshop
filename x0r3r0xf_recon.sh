#!/bin/bash

cat << "EOF"
                  I need a little cuddle..
                    - AissaM3kky
EOF

### Dirs Preparing..
main_domains=$1
sudo mkdir ./results
sudo mkdir ./results/tools
### End Dirs Preparing



for domain in $(cat $main_domains)
do
### Start Passive Recon
 printf "

\e[96m##################################################\e[0m
   \e[96mWill Start Retrieving Subdomains From hackertarget On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
curl --silent --insecure "https://api.hackertarget.com/hostsearch/?q=$domain" | cut -d "," -f 1 >> ./results/tools/apis_subdomain.txt
 printf "

\e[96m##################################################\e[0m
   \e[96mWill Start Retrieving Subdomains From threatcrowd On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
curl --silent --insecure "https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$domain" | grep  -oE "[a-zA-Z0-9._-]+\.$domain" | tee ./results/tools/apis_subdomain.txt
 printf "

\e[96m##################################################\e[0m
   \e[96mWill Start Retrieving Subdomains From Crtsh On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
python3 /home/x0r3r0xf/tools/crtsh/crtsh.py -d $domain >> ./results/tools/apis_subdomain.txt
 printf "

\e[96m##################################################\e[0m
   \e[96mWorking With Amass [Enum-Passive] Mode.. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
amass enum -passive -norecursive -noalts -d $domain -o ./results/tools/amass_enum.txt
printf "

\e[96m##################################################\e[0m
   \e[96mWorking With Amass [Intel-Reverse Whois] Mode.. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
#amass intel -whois -d $domain -o ./results/tools/amass_intel.md
### End Passive Recon


### Start Active Recon

 printf "

\e[96m##################################################\e[0m
   \e[96mWorking With Sublist3r .. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
python2.7 /home/x0r3r0xf/tools/Sublist3r/sublist3r.py -d $domain -v -o ./results/tools/sublist3r_subdomains.txt
 printf "

\e[96m##################################################\e[0m
   \e[96mWorking With Findomain .. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
/home/x0r3r0xf/tools/findomain --quiet --target $domain -o
cat ./$domain.txt | sort -u | uniq | uro >> ./results/tools/findomain_subdomains2.txt
rm -rf ./$domain.txt
cat ./results/tools/findomain_subdomains2.txt | sed 's/:\/\///' >> ./results/tools/findomain_subdomains.txt
rm -rf ./results/tools/findomain_subdomains2.txt
 printf "

\e[96m##################################################\e[0m
   \e[96mWorking With Subfinder .. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
/home/x0r3r0xf/tools/subfinder -d $domain -o "./results/tools/subfinder_subdomains.txt"

 printf "

\e[96m##################################################\e[0m
   \e[96mBruteForcing Subdomain With GoBuster .. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
/home/x0r3r0xf/go/bin/gobuster dns -d $domain -w /home/x0r3r0xf/wordlist/subdomain_5000.txt -o "./results/tools/gobuster_subdomains2.txt"
cat ./results/tools/gobuster_subdomains2.txt | cut -d " " -f 2 >> ./results/tools/gobuster_subdomains.txt
rm -rf ./results/tools/gobuster_subdomains2.txt


 printf "

\e[96m##################################################\e[0m
   \e[96mWorking With Knockpy .. On\e[0m \e[31m$domain\e[0m
\e[96m##################################################\e[0m

"
sudo mkdir -p ./results/tools/$domain-knockpy-fast/
sudo chmod 777 ./results/tools$domain-knockpy-fast/
python3 /home/x0r3r0xf/tools/knock/knockpy.py $domain --no-http -o ./results/tools/$domain-knockpy-fast/

#mkdir -p ./results/tools/$domain-knockpy-deep/
#chmod 777 ./results/tools/$domain-knockpy-deep/
#knockpy $domain -o ./results/tools/$domain-knockpy-deep/
### End Active Recon
done


 printf "

\e[96m##################################################\e[0m
   \e[96m Sorting and Unique Subdomains... \e[0m \e[31m\e[0m
\e[96m##################################################\e[0m

"

cat ./results/tools/*.txt | sort -u | uniq > ./results/all_subdomains.txt


 printf "

\e[96m##################################################\e[0m
   \e[96m Make Wordlist for subdomain bruteforcing ... \e[0m \e[31m>> all_subdomains <<\e[0m
\e[96m##################################################\e[0m

"

touch ./results/special_wordlist.txt
i=0
while [ $i -ne 7 ]
do
        i=$(($i+1))
        cat  ./results/all_subdomains.txt | sed 's/www.//' | cut -d "." -f $i | sed -r '/^\s*$/d' >> ./results/specialx_wordlist.txt
done

cat ./results/special_wordlist.txt | sort -u | uniq > ./results/special_wordlist.txt
rm -rf ./results/specialx_wordlist.txt


 printf "

\e[96m##################################################\e[0m
   \e[96mGet Livesubdomains...\e[0m \e[31m>> httprobe <<\e[0m
\e[96m##################################################\e[0m

"
cat ./results/all_subdomains.txt | /home/x0r3r0xf/go/bin/httpx -silent -mc 200,301,302 | /home/x0r3r0xf/go/bin/anew ./results/live_subdomains.txt


 printf "

\e[96m##################################################\e[0m
   \e[96mScreenshooting live subdomains...\e[0m \e[31m>> aquatone [Not working on VPS] <<\e[0m
\e[96m##################################################\e[0m

"


#cat ./results/live_subdomains.txt | /usr/bin/aquatone -scan-timeout 3000 -threads 5 -silent -screenshot-timeout 50000 -http-timeout 20000 -out subs-screenshots-folder





























