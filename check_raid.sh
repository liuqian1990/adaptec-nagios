#!/bin/sh
#for i in `/root/cmdline/arcconf GETCONFIG 1 PD | grep State  | awk '{print $3}'`
#do
#    if [[ $i == Online ]];then
#        echo -e "\033[32m DEVICE $num is online\033[0m"
#    else
#        echo -e "\033[31m DEVICE $num is offline\033[0m"
#    fi
#    #((num++))
#done 

get_status(){
    str=`sudo /usr/local/nagios/bin/arcconf GETCONFIG 1 PD | grep State  | awk '{print $3}' | sed -n ''$1'p'`
    num=$(($1-1))
    if [[ $str == Online ]];then
        echo -e "\033[32m DEVICE $num is online\033[0m"
        exit 0
    else
        echo -e "\033[31m DEVICE $num is offline\033[0m"
        exit 2
    fi
}


#case "$1" in
#    -d|--disk)
      case "$1" in 
           disk0)
             get_status 1
      ;;

           disk1)
             get_status 2
      ;;

disk2)
    get_status 3
;;

disk3)
    get_status 4
;;
disk4)
    get_status 5
;;
esac
