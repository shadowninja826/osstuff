#!/usr/bin/env bash
# a simple script that will execute  a few commands to capture
# the processes currently running and will output
# information into a file located in the working directory
# Soda Chheng June 26 2017

todayoutput=$(date +"%Y%m%d")_output.txt
clock >> $todayoutput
wait
#commands to obtain the networking information
echo -e "\n\n *** --- obtain the current network information --- *** \n\n" >> $todayoutput
echo -e "\n\n ** execute  ifconfig \n\n" >> $todayoutput | ifconfig  >> $todayoutput
wait
echo -e "\n\n ** execute  netstat -v -a \n\n" >> $todayoutput | netstat -v -a >> $todayoutput
wait
echo -e "\n\n ** execute  netstat -anlp  \n\n" >> $todayoutput | netstat -anlp >> $todayoutput
wait
echo -e "\n\n ** execute  ss -pem \n\n" >> $todayoutput | ss -pem >> $todayoutput
wait

#commands to obtaine process and memory utilization
echo -e "\n\n *** --- obtain the current process and memory information --- *** \n\n" >> $todayoutput

echo -e "\n\n ** execute  top -n 3 \n\n" >> $todayoutput | top -n 3 >> $todayoutput
wait
echo -e "\n\n ** execute  ps aux \n\n" >> $todayoutput | ps aux >> $todayoutput
wait
echo -e "\n\n ** execute  vmstat -wat 5 3 \n\n" >> $todayoutput | vmstat -wat 5 3 >> $todayoutput
wait
echo -e "\n\n ** execute  iostat -cdhx 5 3 \n\n" >> $todayoutput | iostat -cdhx 5 3 >> $todayoutput
wait
echo -e "\n\n ** execute  systemctl  -l --show-type --all --no-pager  \n\n" >> $todayoutput | systemctl  -l --show-type --all --no-pager >> $todayoutput
wait
#commands to obtain disk related information
echo -e "\n\n  *** --- obtain the current disk utilization information --- *** \n\n" >> $todayoutput
echo -e "\n\n ** execute  df -h \n\n" >> $todayoutput | df -h >> $todayoutput
wait
echo -e "\n\n ** execute  find /var/ -type f -exec du -Sh {} + | sort -rh | head -n 10 \n\n" >> $todayoutput | find /var/ -type f -exec du -Sh {} + | sort -rh | head -n 10 >> $todayoutput
wait
echo -e "\n\n ** execute  find /tmp/ -type f -exec du -Sh {} + | sort -rh | head -n 10 \n\n" >> $todayoutput | find /tmp/ -type f -exec du -Sh {} + | sort -rh | head -n 10 >> $todayoutput
wait
echo -e "\n\n ** execute  du -a /tmp | sort -n -r | head -n 10 \n\n" >> $todayoutput | du -a /tmp | sort -n -r | head -n 10 >> $todayoutput
wait
echo -e "\n\n ** execute  du -a /var | sort -n -r | head -n 10 \n\n" >> $todayoutput | du -a /var | sort -n -r | head -n 10 >> $todayoutput

wait


echo -e "\n\n *** --- script completed  --- *** \n\n" >> $todayoutput | clock >> $todayoutput
echo -e script is completed and placed as $todayoutput
