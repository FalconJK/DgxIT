# Function of Each File
### 1. `run.sh` : build container, need 4(or 5) parameter
```bash
~/dgxit$ ./run.sh [Registry] [Tag] [User] [Password] [StopContainerName]
```
### 2. `t.sh` : test file of `run.sh`
### 3. `show.sh` : Show User's Containers, 2 mode:
```bash
~/dgxit$ ./show.sh [User]
# Show User's All Containers
~/dgxit$ ./show.sh [ContainerName] [Code]
# Show information when Create/Restart error, used by run.sh
```

#### Code : 
* Success : Create/Restart Success
* NotExist : Container is not Exist.
* Error : Rules here 👉http://140.123.111.143:8080/
    * Rule 2 : Ilegal Docker Run : User has Over 3 Containers.
    * Rule 3 : Ilegal Docker Run : Container Is Already Exist.


### 4. `restart.sh` : restart Container & restart jupyter service
### 5. `restartall.sh` : restart all container's jupyterlab service
---
### 6. `nv.sh` : install nvtop's shell script
### 7. `lab.sh` : generate by run.sh, include user's password, start jupyter service
### 8. `check.sh` : not important, just test some idea


