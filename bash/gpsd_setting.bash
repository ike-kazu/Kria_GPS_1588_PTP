mv /dev/ttyUL0 /dev/tty16
systemctl stop gpsd.socket gpsd.service
sleep 1
systemctl disable gpsd.socket gpsd.service
sleep 1
systemctl stop gpsd.service
sleep 3
systemctl start gpsd.service
killall -9 gpsd
gpsd -n -N /dev/tty16 &
sleep 2
echo "gpsd service started"
