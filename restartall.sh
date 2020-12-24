#! /bin/bash
filename='runlist.txt'
exec <$filename

while read container; do
    docker restart $container 
    docker exec -idt $container sh /tmp/lab.sh
done
docker exec -idt DgxGuide /etc/init.d/ssh restart
RedBlink() {
    echo -e "\033[31m\033[5m$1\033[0m"
}

Yellow() {
    echo -e "\033[33m$1\033[0m"
}
Purple() {
    echo -e "\033[35m$1 \033[0m"
}
Blue() {
    echo -e "\033[36m$1\033[0m"
}
clear
Purple "---------------------------------------------------------Information---------------------------------------------------------"

Running=$(docker ps -f "name=_" -q | wc -l)
test $Running -gt 1 && Yellow "Your All Containers" || Yellow "Your Container"
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" -f "name=_"
echo
echo -e "\033[32mRunnng : $Running\033[0m"
Blue "Total : $(docker ps -f "name=_" -aq | wc -l)"

Purple "-----------------------------------------------------------------------------------------------------------------------------"
