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
   \e[96mExtract  JS Files ~ \e[0m \e[31mX0RJsCript\e[0m
\e[96m##################################################\e[0m
"

cp ../COMMONLY/jsfiles.txt ./

for subdomain in $(cat $subdomains)
do
python3 collection/getsrc.py $subdomain | anew jsfiles.txt
done;

 printf "

\e[96m##################################################\e[0m
   \e[96mFilter Live JS Files ~ \e[0m \e[31mX0RJsCript\e[0m
\e[96m##################################################\e[0m
"

cat jsfiles.txt | python3 collection/antiburl.py -A -X 404 -H 'header:value' 'header2:value2' -N -C "mycookies=10" -T 50 > livejs.txt
cat livejs.txt | grep -a "200" | awk '{print $2}' > jsfiles-live.txt
rm -rf livejs.txt

 printf "

\e[96m##################################################\e[0m
   \e[96mExtract links from JSFiles ~ \e[0m \e[31mX0RJsCript\e[0m
\e[96m##################################################\e[0m
"

for jsDomain in $(cat jsfiles-live.txt)
do
echo -e "[url] $jsDomain" > JsPaths_linkfinder.txt
python3 ~/tools/LinkFinder/linkfinder.py -i $jsDomain -o cli | tee JsPaths_linkfinder.txt
echo -e "\n" >> JsPaths_linkfinder.txt
done;
cat JsPaths_linkfinder.txt | python3 collection/collector.py js-output
cat js-output/urls.txt | sort -u | uniq > all-js-urls.txt


 printf "

\e[96m##################################################\e[0m
   \e[96mSecret Finder  ~ \e[0m \e[31mX0RJsCript\e[0m
\e[96m##################################################\e[0m
"
cat jsfiles.txt | xargs -n2 -I @ bash -c 'echo -e "~~~~~~~~~~~~~~~ New Target ~~~~~~~~~~~~~~";python3 ~/tools/secretfinder/SecretFinder.py -i @ -o cli; echo -e "---------------------------------------"' >> secretJs.txt

for jsDomain in $(cat jsfiles.txt)
do

python3 ~/tools/SecretFinder/SecretFinder.py -i $jsDomain -o cli | tee secretJs.txt

done;

 printf "

\e[96m##################################################\e[0m
   \e[96mCan i purchase it?  ~ \e[0m \e[31mX0RJsCript\e[0m
\e[96m##################################################\e[0m
"

cat js-output/urls.txt | sort -u | uniq | python3 collection/availableForPurchase.py | tee CanIPurchase.txt

 printf "

\e[96m##################################################\e[0m
   \e[96mFind hidden params in js files  ~ \e[0m \e[31mX0RJsCript\e[0m
\e[96m##################################################\e[0m
"

for jsDomain in $(cat jsfiles.txt)
do
vars=$(curl -s $jsDomain | grep -Eo "var [a-zA-Z0-9]+" | sed -e 's,'var','"$jsDomain"?',g' -e 's/ //g' | grep -v '.js' | sed 's/.*/&=xss/g'); echo -e "\e[1;33m$jsDomain\n\e[1;32m$vars"
done;

 printf "

\e[96m##################################################\e[0m
   \e[96mBy ~ \e[0m \e[31mx0r3r0xf\e[0m
\e[96m##################################################\e[0m
"
















