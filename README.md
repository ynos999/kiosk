# Web kiosk on Ubuntu 20.04
# If necessary, make a modification. Read the comments for each line "build.sh".

Script "build.sh" create user "kiosk" and mount Windows share to folder "/data". 
Script "move.sh" move all "kiosk" user download files to "/data" folder.

```
1. Install Ubuntu Desktop 20.04.1
2. Then open terminal and install ---> sudo apt install -y openssh-server
3. sudo systemctl enable sshd
4. Connect with ssh (putty)
5. Create folder "Project" mkdir /home/MyUser/Desktop/Project ("MyUser" - is your Ubuntu username)
6. Copy all project to Ubuntu Desktop folder /home/MyUser/Desktop/Project
7. Give chmod. cd /home/MyUser/Desktop/Project and sudo chmod +x build.sh
8. If necessary, make a modification. Read the comments for each line.
9. Download https://www.mozdevgroup.com/dropbox/okcd/91.0/Release11/OpenKiosk91.7.0-2022-02-22-x86_64.deb and save to Project folder.
10. Run code with root user ./build.sh

# On the lightdm configuration screen select lightdm

OpenKiosk default password "admin"
Log out from OpenKiosk Shift + F1
Change default password "admin" to Your...
Install Download Master addonos on OpenKiosk. If You need download files...
change keyboard Ubuntu Desktop to Your langyage

```
# При необходимости внесите изменения. Прочитайте комментарии к каждой строке "build.sh".
```
1. Установите Ubuntu Desktop 20.04.1
2. Затем откройте терминал и установите ---> sudo apt install -y openssh-server
3. sudo systemctl включить sshd
4. Подключиться по ssh (putty)
5. Создайте папку "Project" mkdir /home/MyUser/Desktop/Project ("MyUser" - ваше имя пользователя Ubuntu)
6. Скопируйте весь проект в папку Ubuntu Desktop /home/MyUser/Desktop/Project
7. Дайте chmod. cd /home/MyUser/Desktop/Project и sudo chmod +x build.sh
8. При необходимости внесите изменения. Прочитайте комментарии к каждой строке.
9. Загрузите https://www.mozdevgroup.com/dropbox/okcd/91.0/Release11/OpenKiosk91.7.0-2022-02-22-x86_64.deb и сохраните в папку проекта.
10. Запустите код с пользователем root ./build.sh

# На экране конфигурации lightdm выберите lightdm

Пароль OpenKiosk по умолчанию "admin"
Выйти из OpenKiosk Shift + F1
Измените пароль по умолчанию "admin" на Ваш...
Установите дополнения Download Master на OpenKiosk, если вам нужны файлы для загрузки...
изменить клавиатуру Ubuntu Desktop на свой язык
```
