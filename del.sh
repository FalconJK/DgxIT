#! /bin/bash
Container=$1

OIFS="$IFS"
IFS='_'
read -ra n <<<"$Container"
IFS=$OIFS
Name=${n[0]}

CheckContainerExist() {
    test $(docker ps -f "name=$Container" -a | grep -w $Container | wc -l) -eq 1 && echo "true" || echo "false"
}

if [ $(CheckContainerExist) == "false" ]; then
    ./show.sh $Container NotExist
else
    echo -e "\033[33mDeleting:$Image\033[0m"
    docker rm -f $Container
    ./show.sh $Name
fi
./update.sh
