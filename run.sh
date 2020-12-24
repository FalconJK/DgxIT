#! /bin/bash
# author:Falconjk
# email:falconjk@alum.ccu.edu.tw
#----------------------------------------Variable
Counts=3
# Parameter
ParametersCounts=$#
Repository=$1
Tag=$2
Name=$3
Password=$4

# Split Library from Repository
OIFS=$IFS
IFS='/'
read -ra tmp <<<$Repository
IFS=$OIFS
Library=${tmp[2]} # example:nvcr.io/nvidia/tensorflow, Library is 3rd position in array

# New Define Parameter
Image=$Repository":"$Tag
Container=$Name"_"$Library"_"$Tag #NameTag
test $Library == "matlab" && Super="sudo " || Super=""

#----------------------------------------Function
CheckImageExist() {
    test $(docker images $Image -q | wc -l) -eq 1 && echo "true" || echo "false"
}

Stoppable() {
    test $ParametersCounts -ge 5 && echo "true" || echo "false"
}

Rule2() {
    test $(docker ps -f "name=$Name" -q | wc -l) -lt $Counts && echo "true" || echo "false"
}

Rule3() {
    test $(docker ps -f "name=$Container" -aq | wc -l) -eq 1 && echo "false" || echo "true"
}

# ---
RunInit() {
    CreateInit
    docker cp init.sh $Container:/tmp
    docker exec -it $Container $Super sh /tmp/init.sh
}

Installnvtop() {
    docker cp nv.sh $Container:/tmp
    docker exec -it $Container $Super sh /tmp/nv.sh
    docker exec -it $Container pip install jupyterlab-nvdashboard
    docker exec -it $Container jupyter labextension install jupyterlab-nvdashboard
}

InstallCodeServer() {
    docker cp vs.sh $Container:/tmp
    docker exec -it $Container sh /tmp/vs.sh
    docker exec -idt $Container code-server
}

StartService() {
    CreateLab
    docker cp lab.sh $Container:/tmp
    docker exec -idt $Container $Super sh /tmp/lab.sh
}

ChangeResolution() {
    docker exec -idt $Container vncserver -kill :1
    docker exec -idt $Container vncserver -geometry 1920x1080 :1
}



CreateInit() {
    test $Library != "matlab" && JupyterConfig="jupyter notebook --generate-config"
    {
        echo "apt-get update && apt-get install -y ssh cmake libncurses5-dev libncursesw5-dev git tree"
        echo "sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config"
        echo "sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config"
        echo "echo 'root:$Password' | chpasswd"
        echo "$JupyterConfig"
    } >init.sh
}

CreateLab() {
    test $Library != "matlab" && Jupyter="jupyter lab --allow-root --ip 0.0.0.0 --no-browser --NotebookApp.password=\"\$(echo $Password | python -c 'from notebook.auth import passwd;print(passwd(input()))')\""
    {
        echo /etc/init.d/ssh restart
        echo $Jupyter
    } >lab.sh
}

#----------------------------------------Main
if [ $(CheckImageExist) == false ]; then
    echo -e "\033[33mDownloading:$Image\033[0m"
    docker pull $Image
fi

if [ $(Stoppable) == true ]; then
    echo -e "\033[31mStoping:$5\033[0m"
    docker stop $5
fi



if [ $(Rule2) == false ]; then
    ./show.sh $Name "Rule2"
elif [ $(Rule3) == false ]; then
    ./show.sh $Name "Rule3"
else
    # docker run
    case $Library in
    "tensorflow")
        echo "Tensorflow"
        NV_GPU=0,1,2,3 nvidia-docker run -idt --name $Container -p 22 -p 8888 -v /home/lab120/user_data/$Name:/workspace/$Name/ \
            -v /raid/DataSet/$Name:/workspace/DataSet -v /raid/ShareDataSet:/workspace/Share $Image bash
        RunInit
        Installnvtop
        StartService
        ;;

    "pytorch")
        echo "Pytorch"
        NV_GPU=0,1,2,3 nvidia-docker run -idt --name $Container -p 22 -p 8888 -v /home/lab120/user_data/$Name:/workspace/$Name/ \
            -v /raid/DataSet/$Name:/workspace/DataSet -v /raid/ShareDataSet:/workspace/Share $Image bash
        RunInit
        Installnvtop
        StartService
        ;;

    "mxnet")
        echo "Mxnet"
        NV_GPU=0,1,2,3 nvidia-docker run -idt --name $Container -p 22 -p 8888 -v /home/lab120/user_data/$Name:/workspace/$Name/ \
            -v /raid/DataSet/$Name:/workspace/DataSet -v /raid/ShareDataSet:/workspace/Share $Image bash
        RunInit
        StartService
        ;;

    "matlab")
        echo "Matlab"
        NV_GPU=0,1,2,3 nvidia-docker run -idt --name $Container -p 22 -p 5901 -p 6080 \
            --shm-size=512M -v /home/lab120/user_data/$Name:/home/matlab/Documents/MATLAB/$Name/ -e PASSWORD=$Password \
            -v /raid/DataSet/$Name:/home/matlab/Documents/MATLAB/DataSet -v /raid/ShareDataSet:/home/matlab/Documents/MATLAB/Share $Image bash
        RunInit
        Installnvtop
        # ChangeResolution
        StartService
        ;;
    *)
        echo "Other-->"$Library
        NV_GPU=0,1,2,3 nvidia-docker run -idt --name $Container -P -v /home/lab120/user_data/$Name:/workspace/$Name/ \
            -v /raid/DataSet/$Name:/workspace/DataSet -v /raid/ShareDataSet:/workspace/Share $Image bash
        RunInit
        StartService
        ;;
    esac
    # Information of user's Containers
    ./show.sh $Container Success
    echo "Password : $Password"
fi
./update.sh
