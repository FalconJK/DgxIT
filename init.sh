apt-get update && apt-get install -y ssh cmake libncurses5-dev libncursesw5-dev git tree
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
echo 'root:minsiou0734' | chpasswd
jupyter notebook --generate-config
