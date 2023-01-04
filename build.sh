#!/bin/bash

#Install package
echo "====== 1. Update & install package ======"
sudo apt update && sudo apt install -y lightdm x11vnc slick-greeter

#Install OpenKiosk
echo "====== 2. Install OpenKiosk ======"
sudo apt install -y ./OpenKiosk91.7.0-2022-02-22-x86_64.deb 

#Create user kiosks
echo "====== 3. Creating kiosk group and user ======"
sudo groupadd kiosk
sudo useradd kiosk -s /bin/bash -m -g kiosk -p '*'
sudo passwd -d kiosk
sudo passwd -l kiosk

#Create directory
echo "====== 4. Create directory ======"
sudo mkdir -p /home/kiosk/.config/autostart

#Add new line in crontab. This script copy every minute files from user /home/MyUser/Downloads to /data folder. This folder mount with windows share... If Youn don't need leave a comment #
sudo echo "* * * * *	root	/srv/move.sh" >> /etc/crontab

#Restart crontab. If Youn don't need leave a comment #
echo "====== 6. Restart crontab ======"
sudo systemctl restart cron.service

#Copy files
echo "====== 7. Copy files ======"
sudo cp ./50-myconfig.conf /etc/lightdm/lightdm.conf.d/50-myconfig.conf
sudo cp ./lightdm.conf /etc/lightdm/lightdm.conf
sudo cp ./kiosk.desktop /home/kiosk/.config/autostart/kiosk.desktop
sudo cp ./kiosk.sh /home/kiosk/.kiosk.sh
# If Youn don't need leave a comment # sudo cp ./move.sh /srv/move.sh
sudo cp ./move.sh /srv/move.sh

#Create x11vcn password
echo "====== 8. Create x11vcn password ======"
sudo x11vnc -storepasswd kiosk2023 /home/kiosk/.x11vnc.pass

#Give chmod & chown
echo "====== 9. Chmod & chown ======"
# If Youn don't need leave a comment # sudo chmod +x /srv/move.sh 
sudo chmod +x /srv/move.sh 
sudo chmod -R 644 /home/kiosk/.config/autostart/kiosk.desktop
sudo chmod 755 /home/kiosk/.kiosk.sh
sudo chmod 755 /home/kiosk/.config/autostart/
sudo chmod 644 /etc/lightdm/lightdm.conf
sudo chmod 644 /etc/lightdm/lightdm.conf.d/50-myconfig.conf
# If Youn don't need leave a comment # sudo chmod 755 /srv/move.sh
sudo chmod 755 /srv/move.sh

#Mount disk. If You don't need leave a comment #
echo "====== 10. Mount disk ======"
mkdir /data
# You need change MyUser and MyPassword. Compatibility with Windows active directory. UID is your Ubuntu user UID. grep MyUserName /etc/passwd
sudo echo "//10.0.10.7/Test     /data     cifs   username=MyUser,password=MyPassword,domain=MyAdDomain,uid=1001,noperm,rw 0 0" >> /etc/fstab
# Or use Windows share without Active directory.
#sudo echo "//192.168.1.138/Test     /data     cifs   username=MyUser,password=MyPassword,dir_mode=0777,file_mode=0777 0 0" >> /etc/fstab

#Install Zabbix agent. If Youn don't need leave a comment # 
echo "====== 11. Install Zabbix ======"
sudo dpkg -i ./zabbix-release_6.2-4+ubuntu22.04_all.deb
sudo apt update && sudo apt install -y zabbix-agent2 zabbix-agent2-plugin-*  
sudo systemctl enable zabbix-agent2
echo "Server=192.168.1.201" >>  /etc/zabbix/zabbix_agent2.conf # Change to Your IP
echo "Hostname=Kiosk" >>  /etc/zabbix/zabbix_agent2.conf # Change to Your hostname
sudo systemctl restart zabbix-agent2

#Add ssh & 10050 port to firewall. If Youn don't need leave a comment # 
echo "====== 12. Add ssh & 10050 port to firewall ======"
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow 10050/tcp
sudo ufw allow 3389
sudo ufw enable

# Change to Your hostname. If Youn don't need leave a comment #
echo "====== 13. Change hostname ====="
sudo echo "kiosk-test" > /etc/hostname 
sudo hostnamectl

#Change Static IP. If You need change IP, please uncomment lines. Make change in file 01-network-manager-all.yaml.
#echo "====== 14. Change IP ====="
#sudo cp ./01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml
#sudo netplan apply
 
# Reboot system
echo "====== Done ====="
echo "====== Reboot system ======"
sudo reboot
