sudo apt-get update
sudo apt-get -y install leafpad
sudo apt-get -y install dnsmasq
sudo apt-get -y install hostapd

sudo cp interfaces /etc/network/interfaces
sudo cp dhcpcd.conf /etc/dhcpcd.conf
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo cp hostapd.conf /etc/hostapd/hostapd.conf
sudo cp hostapd /etc/default/hostapd

sudo systemctl stop hostapd
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

####  mjpg-streamer
sudo apt-get -y install cmake
sudo apt-get -y install libjpeg8-dev
sudo apt-get -y install imagemagick
sudo apt-get -y install libv4l-dev

sudo cp mjpg_streamer.service /lib/systemd/system/mjpg_streamer.service
sudo systemctl enable mjpg_streamer.service


tar xvf 0509b.tar -C /home/pi/
cd /home/pi/0509b/mjpg-streamer/mjpg-streamer-experimental
sudo make install

echo "OK to install, reboot system"