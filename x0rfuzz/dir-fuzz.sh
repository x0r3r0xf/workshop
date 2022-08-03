#!/bin/bash

cat << "EOF"
                  I'M WHAT I'M BECAUSE WHAT OF WE ALL ARE.
                    - X0R3R0xF
EOF
sleep 1
### Dirs Preparing..
subdomains=$1
output=$2
### End Dirs Preparing

 printf "

\e[96m##################################################\e[0m
   \e[96mSimple Dir Fuzzing ~ \e[0m \e[31mX0Rfuzz\e[0m
\e[96m##################################################\e[0m
"

echo -n "Enter the Wordlist [main|php|aspx|js|admin]: "
read wordlist

for subdomain in $(cat $subdomains)
do
cat $subdomains | xargs -n2 -I @ bash -c "echo -e '[URL] @';ffuf -u @/FUZZ -w ./wordlist/$wordlist.txt -t 200 -s -ac; echo -e '--------------------------------------------------------------------'" 2> /dev/null | tee $output
done;

 printf "

\e[96m##################################################\e[0m
   \e[96mBy ~ \e[0m \e[31mx0r3r0xf\e[0m
\e[96m##################################################\e[0m
"
