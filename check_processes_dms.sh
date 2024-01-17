# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

RED='\033[0;31m'
NC='\033[0m' # No Color
for i in `echo "vpostgresql rabbitmq-server provider monitoring apms update-manager rclone"`
do
	is_active=`systemctl status --no-pager $i | grep Active | awk '{print $2}'`
	if [ "$is_active" != "active" ]; then
		echo -e "$i is ${RED}not $is_active${NC}"
	else
		echo -e "$i is $is_active"
	fi

done
