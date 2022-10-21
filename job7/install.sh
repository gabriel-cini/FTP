#!/bin/bash

#pour mettre a jours les paquets 
sudo apt-get update && sudo apt-get upgrade -y
#Installer SSH et proftpd
sudo install ssh -y
sudo install proftpd -y

#Utilisateurs
mdpc=$(perl -e 'print crypt("kalimac", "salt")')
mdcp1=$(perl -e 'print crypt ("secondebreakfast", "salt")')

sudo useradd -m -p $mdpc 'Merry'
sudo useradd -m -p $mdpc1 'Pippin'
cd /etc/proftpd
cp proftpd.conf proftpd.conf.save
echo "<Anonymous ~ftp>
User ftp
Group nogroup
UserAlias anonymous ftp
DirfakeUser on ftp
Dirfakegroup on ftp
Maxclients 140
Displaylogin welcome.msg
Displaychdir.message

<Directory *>
<Limit Write>
Allowall
</limit>
<Directory>

<Directory incoming>
<Limit READ WRITE>
Allowall
</Limit>
</Directory>
</Anonymous>
>> proftpd.com
sudo systemct1 restart proftpd
sudo systemct1 status proftpd

