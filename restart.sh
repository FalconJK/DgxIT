#! /bin/bash
Counts=3

ParametersCounts=$#
Container=$1

OIFS="$IFS"
IFS='_'
read -ra n <<<"$Container"
IFS=$OIFS
Name=${n[0]}

Rule2() {
    test $(docker ps -f "name=$Name" -q | wc -l) -lt $Counts && echo "true" || echo "false"
}

CheckContainerExist() {
    test $(docker ps -f "name=$Container" -a | grep -w $Container | wc -l) -eq 1 && echo "true" || echo "false"
}

Stoppable() {
    test $ParametersCounts -ge 2 && echo "true" || echo "false"
}

if [ $(Stoppable) == "true" ]; then
    echo -e "\033[31m Stoping:$2\033[0m"
    docker stop $2
fi

if [ $(Rule2) == "false" ]; then
    ./show.sh $Name Rule2
elif [ $(CheckContainerExist) == "false" ]; then
    ./show.sh $Container NotExist
else
    echo -e "\033[33mRestarting:$Image\033[0m"
    docker restart $Container
    docker exec -d $Container sh /tmp/lab.sh
    ./show.sh $Container Success
fi
./update.sh
