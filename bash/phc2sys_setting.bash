timedatectl
phc_ctl /dev/ptp0 get

echo "*********************** Phc2sys Running *****************************"
phc2sys -c /dev/ptp0 -s CLOCK_REALTIME -O 0 &
sleep 5
echo "*************** PHC clock Syncronized with system clock***************"
phc_ctl /dev/ptp0 get
timedatectl
