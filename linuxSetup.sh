#Update Debian Operating System
apt-get -q -y update
#install dbus
apt-get -q -y install dbus
dpkg --configure -a

#Upgrade again
apt-get upgrade -q -y
apt-get dist-upgrade -q -y


# Install X & LXDE & VNC
apt-get -q -y install xorg lxde-core tightvncserver

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#Install Java 8 
apt-get -q -y install software-properties-common
add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
sudo apt-get -q -y update 2>&1 1>/dev/null | sed -ne 's/.*NO_PUBKEY //p' |
while read key; do
    echo 'Processing key:' "$key"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "$key"
done
apt-get -q -y install -q -y oracle-java8-installer

#Dreambot Stuff
mkdir ~/Desktop/
curl -o ~/Desktop/DBLauncher.jar https://dreambot.org/DBlauncher.jar
chmod 777 ~/Desktop/DBLauncher.jar

#Install Chromium
apt-get -q -y install chromium

#Asks for pw here
tightvncserver :1
tightvncserver -kill :1


#add configs
wget https://gist.github.com/anonymous/d0606a74a17247134e74b6f20abe24ab/raw/7be591567fc5e3324fcac5d7edfc63d36a3684b4/xstartup -O ~/.vnc/xstartup

#boot VNC Server
tightvncserver :1

