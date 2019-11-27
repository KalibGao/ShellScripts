# install docker 
sudo yum install -y yum-utils \
device-mapper-persistent-data \
lvm2

# docker official repo images, if you use aliyun ECS, configure aliyun repo
# sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

sudo yum install -y docker-ce docker-ce-cli containerd.io 

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://c8zb9ksc.mirror.aliyuncs.com"]
}
EOF 

sudo systemctl daemon-reload
  
sudo systemctl enable docker  | sudo systemctl restart docker


