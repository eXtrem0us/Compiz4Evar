#!/bin/bash

#Download all reguired .deb packages from debian repository

#Compiz Core Packages
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz/compiz-core_0.8.4-4_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz/libdecoration0_0.8.4-4_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz/compiz-plugins_0.8.4-4_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/libg/libgtop2/libgtop2-7_2.28.1-1_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/m/metacity/libmetacity-private0_2.30.1-3_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz/compiz-gtk_0.8.4-4_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/control-center/libgnome-window-settings1_2.30.1-2_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz/compiz-gnome_0.8.4-4_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz/compiz_0.8.4-4_all.deb

#CompizConfig Setting Manager
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz-fusion-plugins-main/compiz-fusion-plugins-main_0.8.4-2+b1_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz-fusion-plugins-extra/compiz-fusion-plugins-extra_0.8.4-2_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compiz-fusion-plugins-unsupported/compiz-fusion-plugins-unsupported_0.8.4-3_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compizconfig-backend-gconf/compizconfig-backend-gconf_0.8.4-1_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/g/gnome-desktop/libgnome-desktop-2-17_2.32.1-2_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/libc/libcompizconfig/libcompizconfig0_0.8.4-2_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/ccsm/compizconfig-settings-manager_0.8.4-2_amd64.deb
wget -t 0 http://ftp.debian.org/debian/pool/main/c/compizconfig-python/python-compizconfig_0.8.4-2_amd64.deb

#Emerald Decorator
wget -t 0 http://mirror.pnl.gov/ubuntu//pool/universe/e/emerald/libemeraldengine0_0.7.2-0ubuntu4_amd64.deb
wget -t 0 http://mirror.pnl.gov/ubuntu//pool/universe/e/emerald/emerald_0.7.2-0ubuntu4_amd64.deb
wget -t 0 http://packages.linuxmint.com/pool/main/e/emerald-themes/emerald-themes_0.7-mint2~julia_all.deb

#-----installing compiz:
sudo apt-get install mesa-utils
sudo dpkg -i compiz-core_0.8.4-4_amd64.deb
sudo dpkg -i libdecoration0_0.8.4-4_amd64.deb
sudo dpkg -i compiz-plugins_0.8.4-4_amd64.deb
sudo apt-get install metacity-common
sudo dpkg -i libgtop2-7_2.28.1-1_amd64.deb
#sudo apt-get install libgtop-2.0-10 #I'm not sure libgtop-2.0-10 works with current version of compiz, currectly. but you can try
#creating and installing modified version of libmetacity-private0:
mkdir tmp
dpkg-deb -x libmetacity-private0_2.30.1-3_amd64.deb tmp/
dpkg-deb --control libmetacity-private0_2.30.1-3_amd64.deb tmp/DEBIAN
cp controls/libmetacity-private0.control tmp/DEBIAN/control
dpkg -b tmp/ ./libmetacity-private0_2.30.1-3_amd64.modified.deb
sudo dpkg -i libmetacity-private0_2.30.1-3_amd64.modified.deb
rm -rf tmp/
sudo dpkg -i compiz-gtk_0.8.4-4_amd64.deb
#sudo apt-get install libgnome-desktop-2-17 #for debian jessie (stable), it's better to use this
sudo dpkg -i libgnome-desktop-2-17_2.32.1-2_amd64.deb #for stretch/sid, you should use this one
sudo dpkg -i libgnome-window-settings1_2.30.1-2_amd64.deb 
sudo dpkg -i compiz-gnome_0.8.4-4_amd64.deb
sudo dpkg -i compiz_0.8.4-4_all.deb

#-----installing plugins:
sudo apt-get install libjpeg62-turbo
#creating and installing modified version of compiz-fusion-plugins-main:
mkdir tmp
dpkg-deb -x compiz-fusion-plugins-main_0.8.4-2+b1_amd64.deb tmp/
dpkg-deb --control compiz-fusion-plugins-main_0.8.4-2+b1_amd64.deb tmp/DEBIAN
cp controls/libmetacity-private0.control tmp/DEBIAN/control
dpkg -b tmp/ ./compiz-fusion-plugins-main_0.8.4-2+b1_amd64.modified.deb
rm -rf tmp/
sudo dpkg -i compiz-fusion-plugins-main_0.8.4-2+b1_amd64.modified.deb
sudo dpkg -i compiz-fusion-plugins-extra_0.8.4-2_amd64.deb
sudo dpkg -i compiz-fusion-plugins-unsupported_0.8.4-3_amd64.deb

#-----installing CompizConfig Setting Manager
sudo dpkg -i libcompizconfig0_0.8.4-2_amd64.deb 
#creating and installing modified version of python-compizconfig
mkdir tmp
dpkg-deb -x python-compizconfig_0.8.4-2_amd64.deb tmp/
dpkg-deb --control python-compizconfig_0.8.4-2_amd64.deb tmp/DEBIAN
cp controls/python-compizconfig.control tmp/DEBIAN/control
dpkg -b tmp/ ./python-compizconfig_0.8.4-2_amd64.modified.deb
rm -rf tmp/
sudo dpkg -i python-compizconfig_0.8.4-2_amd64.modified.deb
sudo dpkg -i compizconfig-settings-manager_0.8.4-2_amd64.deb 

#-----installing emerald
sudo dpkg -i libemeraldengine0_0.7.2-0ubuntu4_amd64.deb
sudo dpkg -i emerald_0.7.2-0ubuntu4_amd64.deb 
sudo dpkg -i emerald-themes_0.7-mint2~julia_all.deb 

#some compatibility stuffs to old package versions:
sudo ln -s /usr/lib/pyshared/python2.6/compizconfig.so /usr/local/lib/python2.7/site-packages/compizconfig.so
sudo ln -s /usr/lib/pyshared/python2.6/compizconfig.so /usr/local/lib/python2.7/dist-packages/compizconfig.so
sudo cp scripts/Utils.py /usr/share/pyshared/ccm/

# These scripts have been extracted from Fedora Mate-Compiz Spin
# https://spins.fedoraproject.org/mate-compiz/
#-----copy appropreate shell binaries to /usr/bin
sudo cp bin/* /usr/bin/


#ToDo: Add above binaries' shortcuts to main menu
#ToDo: Fix incompatibilities between compiz and window's close,restore,minimize buttons, in Mate-Desktop
#ToDo: import compizuser.profile settings, without manual workouts in CompizConfig Setting Manager

