# FastSMBConfEdit
Small bash script, that makes edit samba config easier and faster.

Requirements

Root access(or sudo, to stop/start samba service)

Bash >= 5.1.16

Samba >= 4.15.9

Nano >= 6.2

Usage

Type ./smbfedit.sh and the script will open the config in the standard path (/etc/samba/smb.conf).
If the storage location is different, it can be passed as a parameter to the console, e.g.:
./smbfedit.sh /path-to-file/smb.conf or ./smbfedit.sh /path-to-dir-with-conf/
If the script does not find after that a file or folder with the desired file inside,
then it will ask for the path to this file(not a folder!)

PS:Standart path may be edited in script.Just change the "standardpath" variable.

Troubleshooting:
1)Nano is showing me a blank screen instead of my config!
Check that the file is on the standard path. 
If it is not there, you should check if samba is installed and find it yourself, 
specifying the path to it later to the program.


