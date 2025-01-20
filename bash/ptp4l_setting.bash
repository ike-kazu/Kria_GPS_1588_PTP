ptp4l -i eth0  &
echo "*************** Ptp4l Application is Running***************"

timedatectl
phc_ctl /dev/ptp0 get
