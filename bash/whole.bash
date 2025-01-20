# gpsd
mv /dev/ttyUL0 /dev/tty16
killall -9 gpsd
systemctl stop gpsd.socket gpsd.service
sleep 1
systemctl disable gpsd.socket gpsd.service
sleep 1
gpsd -n -N /dev/tty16 &
sleep 2
echo "gpsd service started"

#chrony
echo "chrony started"
systemctl restart chrony
sleep 180
chronyc sources
chronyc tracking
echo "************** System Clock Syncronized With GPS Time****************"
timedatectl

# phc2sys
timedatectl
phc_ctl /dev/ptp0 get

echo "*********************** Phc2sys Running *****************************"
phc2sys -c /dev/ptp0 -s CLOCK_REALTIME -O 0 &
sleep 5
echo "*************** PHC clock Syncronized with system clock***************"
phc_ctl /dev/ptp0 get
timedatectl

# ptp4l
ptp4l -i eth0  &
echo "*************** Ptp4l Application is Running***************"

timedatectl
phc_ctl /dev/ptp0 get
