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

sudo systemctl enable docker  | sudo systemctl restart docker

# install nginx
sudo yum install -y yum-utils

sudo tee /etc/yum.repos.d/nginx.repo <<- 'EOF'
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOF

sudo yum install -y nginx

sudo systemctl enable nginx | sudo systemctl restart nginx

