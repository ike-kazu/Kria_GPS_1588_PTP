echo "chrony started"
systemctl restart chrony
sleep 180
chronyc sources
chronyc tracking
echo "************** System Clock Syncronized With GPS Time****************"
timedatectl
