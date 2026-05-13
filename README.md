# bash-oscp-setup

This is a simple script begin the enumeration setup for the OSCP. It provides a directories for files, vulnerabilities and hashes. It creates a file with IP addresses and URL's to export as well as files for usernames and passwords. Finally it will perform a TCP and UDP scan and save the output. 

You will be prompted for an IP, what to name the nmap scans and if you would like to add credentials to the creds files.  

I recommend you save it to your ~/bin directory and the export the bin directory to your path by running the command below

```
export PATH="$HOME/bin:$PATH"
```

## Usage
```bash
chmod +x do_scan.sh
do_scan.sh
```
