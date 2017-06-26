#!/usr/bin/env bash
# a simple script that will execute  a few commands to capture
# the processes currently running and will output
# information into a file located in the working directory
# Soda Chheng June 26 2017


clock >> output.txt
wait
#commands to obtain the networking information
echo -e "\n\n *** --- obtain the current network information --- *** \n\n" >> output.txt
echo -e "\n\n ** execute  ifconfig \n\n" >> output.txt | ifconfig  >> output.txt
wait
echo -e "\n\n ** execute  netstat -v -a \n\n" >> output.txt | netstat -v -a >> output.txt
wait
echo -e "\n\n ** execute  netstat -anlp  \n\n" >> output.txt | netstat -anlp >> output.txt
wait
echo -e "\n\n ** execute  ss -pem \n\n" >> output.txt | ss -pem >> output.txt
wait

#commands to obtaine process and memory utilization
echo -e "\n\n *** --- obtain the current process and memory information --- *** \n\n" >> output.txt

echo -e "\n\n ** execute  top -n 3 \n\n" >> output.txt | top -n 3 >> output.txt
wait
echo -e "\n\n ** execute  ps aux \n\n" >> output.txt | ps aux >> output.txt
wait
echo -e "\n\n ** execute  vmstat -wat 5 3 \n\n" >> output.txt | vmstat -wat 5 3 >> output.txt
wait
echo -e "\n\n ** execute  iostat -cdhx 5 3 \n\n" >> output.txt | iostat -cdhx 5 3 >> output.txt
wait
echo -e "\n\n ** execute  systemctl  -l --show-type --all --no-pager  \n\n" >> output.txt | systemctl  -l --show-type --all --no-pager >> output.txt
wait
#commands to obtain disk related information
echo -e "\n\n  *** --- obtain the current disk utilization information --- *** \n\n" >> output.txt
echo -e "\n\n ** execute  df -h \n\n" >> output.txt | df -h >> output.txt
wait
echo -e "\n\n ** execute  find /var/ -type f -exec du -Sh {} + | sort -rh | head -n 10 \n\n" >> output.txt | find /var/ -type f -exec du -Sh {} + | sort -rh | head -n 10 >> output.txt
wait
echo -e "\n\n ** execute  find /tmp/ -type f -exec du -Sh {} + | sort -rh | head -n 10 \n\n" >> output.txt | find /tmp/ -type f -exec du -Sh {} + | sort -rh | head -n 10 >> output.txt
wait
echo -e "\n\n ** execute  du -a /tmp | sort -n -r | head -n 10 \n\n" >> output.txt | du -a /tmp | sort -n -r | head -n 10 >> output.txt
wait
echo -e "\n\n ** execute  du -a /var | sort -n -r | head -n 10 \n\n" >> output.txt | du -a /var | sort -n -r | head -n 10 >> output.txt

wait


echo -e "\n\n *** --- script completed  --- *** \n\n" >> output.txt | clock >> output.txt
echo -e script is completed and placed as output.txt
