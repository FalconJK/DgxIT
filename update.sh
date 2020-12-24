#! /bin/bash
rm runlist.txt
Green() {
    echo -e "\033[32m$1\033[0m"
}

Yellow() {
    echo -e "\033[33m$1\033[0m"
}
Yellow "Updating..."
containers=$(docker ps -f "name=_" -q)
#containers=$(docker ps -aq)
for container in $containers; do
    echo $container >>runlist.txt
done
Green "Update done"
