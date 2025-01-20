mv /dev/ttyUL0 /dev/tty16
killall -9 gpsd
systemctl stop gpsd.socket gpsd.service
sleep 1
systemctl disable gpsd.socket gpsd.service
sleep 1
gpsd -n -N /dev/tty16 &
sleep 2
echo "gpsd service started"