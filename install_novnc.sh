#!/bin/sh
#
# Goorm.io Initialization Script
#
# Installed Services 
# - TightVNCServer
# - Nanum Fonts
# - LXDE Core + xorg
# - Korean language support


apt-get update -y
apt-get upgrade -y
apt-get install -f -y
apt-get install xorg lxde-core lxterminal -y
apt-get install firefox -y

# Install required dependency files
apt-get install -f -y

# Install korean fonts & dependencies
apt-get install fonts-nanum fonts-nanum-* language-selector-common -y
apt-get install `check-language-support -l ko` -y

echo -e "\nLANG=\"ko_KR.UTF-8\"\nLANGUAGE=\"ko:en\"" > /etc/default/locale
echo -e "\nLANG=\"ko_KR.UTF-8\"\nLANGUAGE=\"ko:en\"" > /root/.pam_environment

# Configure VNC Server to run with port 5900
vncserver -geometry 1280x720 :0
vncserver -kill :0

cd /root/.vnc
mv xstartup xstartup.original
echo "/usr/bin/lxsession -s LXDE &" > xstartup
chmod +x xstartup

# Configure noVNC server
apt-get install novnc -y
echo -e "rm -rf /tmp/.X0-lock /tmp/.X11-unix\nvncserver :0 -geometry 1680x920\nwebsockify -D --web=/usr/share/novnc/ 80 localhost:5900" > start_vnc.sh
chmod +x start_vnc.sh
./start_vnc.sh
