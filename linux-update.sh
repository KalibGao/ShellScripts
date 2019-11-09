# update centos environment

sudo yum install -y epel-release 

sudo yum update -y

# install docker 
sudo yum install -y yum-utils \
device-mapper-persistent-data \
lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce docker-ce-cli containerd.io 

# install nginx
