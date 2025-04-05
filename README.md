## Web kiosk on Ubuntu 20.04 or newer
### If necessary, make a modification. Read the comments for each line "build.sh".

Script "build.sh" create user "kiosk" and mount Windows share to folder "/data". 
Script "move.sh" move all "kiosk" user download files to "/data" folder.

```
1. Install Ubuntu Desktop 20.04.1 or latest
2. Then open terminal and install ---> sudo apt install -y openssh-server
3. sudo systemctl enable sshd
4. Connect with ssh (putty)
5. Create folder "Project" mkdir /home/MyUser/Desktop/Project ("MyUser" - is your Ubuntu username)
6. Copy all project to Ubuntu Desktop folder /home/MyUser/Desktop/Project
7. Give chmod. cd /home/MyUser/Desktop/Project and sudo chmod +x build.sh
8. If necessary, make a modification. Read the comments for each line.
9. Download https://www.mozdevgroup.com/dropbox/okcd/115/release/OpenKiosk115.20.0-2025-02-16-x86_64.deb and save to Project folder.
10. Edit 01-network-manager-all.yaml IP
11. Read build.sh file and edit...
12. Run code with root user ./build.sh

# On the lightdm configuration screen select lightdm

OpenKiosk default password "admin"
Log out from OpenKiosk Shift + F1
Change default password "admin" to Your...
Install Download Master addonos on OpenKiosk. If You need download files...
change keyboard Ubuntu Desktop to Your langyage

```