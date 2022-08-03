#!/bin/bash

cat << "EOF"
                  I'M WHAT I'M BECAUSE WHAT OF WE ALL ARE.
                    - X0R3R0xF
EOF
sleep 1
### Dirs Preparing..
subdomains=$1
### End Dirs Preparing

 printf "

\e[96m##################################################\e[0m
   \e[96m Waybackurls ~ \e[0m \e[31mWorking......\e[0m
\e[96m##################################################\e[0m
"
cat $subdomains | waybackurls > Wayback.txt
 printf "

\e[96m##################################################\e[0m
   \e[96m Gauplus ~ \e[0m \e[31mWorking......\e[0m
\e[96m##################################################\e[0m
"
cat $subdomains | gauplus --random-agent -t 25 -b png,jpg,gif -o gauplus.txt
cat Wayback.txt gauplus.txt | egrep -iv "\.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | inscope | anew WayGau.txt

cat Wayback.txt gauplus.txt | grep -iE '\.js' | grep -ivE '\.json'| sort -u >> jsfiles.txt
cp  jsfiles.txt ../COMMONLY/





 printf "

\e[96m##################################################\e[0m
   \e[96m Paramspider ~ \e[0m \e[31mWorking......\e[0m
\e[96m##################################################\e[0m
"

for subdomain in $(cat $subdomains)
do
python3 ~/.tools/ParamSpider/paramspider.py --domain $subdomain --exclude png,js,woff,woff2,css,gif,jpeg,tif,tiff,ico,ttf,txt,jpg,svg --output results.txt
FILE=output/results.txt
if test -f "$FILE"; then
	cat output/results.txt >> subs_paramsx.txt
fi

done;

cat subs_paramsx.txt |  egrep -iv "\.(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | sort -u | uniq  > subs_params.txt
rm -rf  output Wayback.txt gauplus.txt subs_paramsx.txt
 printf "

\e[96m##################################################\e[0m
   \e[96m Prepare ~ \e[0m \e[31mall-InOne.txt......\e[0m
\e[96m##################################################\e[0m
"
cat WayGau.txt subs_params.txt | sort -u | anew |  httpx -silent -fc 404,301 -o all-InOne.txt
mkdir results
mv *.txt ./results/
cat ./all-InOne.txt | grep "?" | qsreplace "FUZZ" > ../COMMONLY/all-inOne.txt



 printf "

\e[96m##################################################\e[0m
   \e[96m Preparing ~ \e[0m \e[31mGf patterns...\e[0m
\e[96m##################################################\e[0m
"

# Declare a string array with type
declare -a GfPatterns=("api-keys" "aws-keys" "base64" "cors" "debug-pages" "debug_logic" "fw" "go-functions" "http-auth" "idor" "interestingsubs" "js-sinks" "ip" "lfi" "php-curl" "php-sinks" "rce" "redirect" "s3-buckets" "sec" "sqli" "ssrf" "ssti" "takeovers" "firebase" "xss")
cd ./results
mkdir GFvulns
# Read the array values with space
for val in "${GfPatterns[@]}"; do
  cat ./all-InOne.txt | gf $val | anew ./GFvulns/$val.txt
  if [ ! -s ./GFvulns/$val.txt ] ; then
  rm ./GFvulns/$val.txt
fi

done
 printf "

\e[96m##################################################\e[0m
   \e[96mMaking [(param|word|directory) list] ~ \e[0m \e[31mx0r3r0xf\e[0m
\e[96m##################################################\e[0m
"

cat ./all-InOne.txt | unfurl -u keys | tee -a paramlist.txt ; cat ./all-InOne.txt | unfurl -u paths |tee -a endpointlist.txt; sed 's#/#\n#g' endpointlist.txt | sort -u | tee -a wordlist.txt | sort -u  | sed -i -e 's/\.css\|\.png\|\.jpeg\|\.jpg\|\.svg\|\.gif\|\.wolf\|\.bmp//g' wordlist.txt
cat paramlist.txt endpointlist.txt | sort -u | uniq >> wordlist.txt













