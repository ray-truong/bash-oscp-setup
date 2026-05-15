#! /bin/bash

read -p "Enter the name of the nmap TCP scan: " tcp_nmap
read -p "Enter the name of the nmap UDP scan: " udp_nmap
read -p "Enter in the IP address to scan: " IP

mkdir tcp_nmap
mkdir udp_nmap

echo "Creating IP file:"
echo -e "export IP=\"$IP\"" >> IP
echo -e "export URL=\"http://$IP\"" >> IP
echo -e "export URL=\"http://$IP/FUZZ\"" >> IP
echo -e "export URL=\"http://$IP/FUZZ/\"" >> IP


echo "Nmap directories created: "

mkdir files
mkdir vulns
echo "Directories files and vulns created: "

read -p "Creating new files, do you want to add credentials? " y_or_n

if [ "$y_or_n" == "y" ] ; then
	read -p "Add a username: " username
	read -p "Add a password: " password
fi

touch users
mkdir hashes
touch passwords
touch creds

if [ "$y_or_n" == "y" ] ; then
	echo ""
	echo "Adding $username and $password to creds file "
	echo "$username \ $password" >> creds
fi
echo ""
echo -e "================================================================\n";
echo ""
echo -e "Begginning TCP nmap scan:\n"

nmap "$IP" -p- -sV -sC -v --open -oA tcp_nmap/"$tcp_nmap" 

echo ""
echo -e "================================================================\n";
echo "Begginning UDP Nmap scan: "
echo ""

nmap -sV -sC "$IP" -v --open -sU --top-ports 100 -oA udp_nmap/"$udp_nmap"

echo "done"

exit
