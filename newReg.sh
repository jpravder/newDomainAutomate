#!/bin/bash
#!/usr/bin/env expect 
cd Sooty
python3.9 Sooty.py $1
domain=$(dig +short $1 | sed -n 1p)
b='https://www.abuseipdb.com/check/'
echo " "
echo "${b}${domain}" 
echo " "
echo "OTX Reputation Check: "
cd ..
cd OTX-Python-SDK
cd examples
cd is_malicious
python3.9 is_malicious.py -host $1
cd ..
cd ..
cd ..
bl $1 | grep "blacklisted"
cd TekDefense-Automater
python Automater.py $domain
echo " "
echo "Isitup.org: "
isup $1
cd ..
cd Unknown-Reputation-Check
python3.9 Main.py --url $1 -virustotal
