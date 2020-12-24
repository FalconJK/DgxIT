Container=$1
Code=$2

OIFS="$IFS"
IFS='_'
read -ra n <<<"$Container"
IFS=$OIFS

Name=${n[0]}
ShowInfo() {
    Running=$(docker ps -f "name=$Name" -q | wc -l)
    test $Running -gt 1 && Yellow "Your All Containers" || Yellow "Your Container"
    docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" -f "name=$Name"
    echo
    test $Running -ge 3 && RedBlink "Running : $Running" || Green "Running : $Running"
    Blue "Total : $(docker ps -f "name=$Name" -aq | wc -l)"
}

RedBlink() {
    echo -e "\033[31m\033[5m$1\033[0m"
}

Green() {
    echo -e "\033[32m$1\033[0m"
}

Yellow() {
    echo -e "\033[33m$1\033[0m"
}
Purple() {
    echo -e "\033[35m$1\033[0m"
}
Blue() {
    echo -e "\033[36m$1\033[0m"
}
clear
Purple "---------------------------------------------------------Information---------------------------------------------------------"
if [ $# -eq 2 ]; then
    case $Code in
    "Success")
        echo Success
        Yellow "Your New Container's Ports:"
        docker port $Container
        echo
        ShowInfo $Name
        ;;
    "NotExist")
        RedBlink "Error: No such container: $Container"
        ShowInfo $Name
        RedBlink "Please Recheck Your Container's Name"
        ;;

    "Rule2")
        RedBlink "Ilegal Docker Run : $Name has Over 3 Containers are Running."
        ShowInfo $Name
        RedBlink "Please Stop or Delete One Container"
        ;;

    "Rule3")
        RedBlink "Ilegal Docker Run : Container Is Already Exist."
        ShowInfo $Name
        RedBlink "Please Restart or Delete it."
        ;;

    esac

else
    ShowInfo $Name
fi
Purple "-----------------------------------------------------------------------------------------------------------------------------"
