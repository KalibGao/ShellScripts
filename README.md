# ShellScripts
Commonly used shell scripts for daily work.

## Simple usage

`curl` download and shell execute

### centos 7 system update 

```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/linux-update.sh | sudo sh 
```

### install git 

```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/git-install.sh | sudo sh
```

### install docker
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/docker-install.sh | sudo sh
```
-- use aliyun docker image mirror
```
sudo mkdir -p /etc/docker

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://c8zb9ksc.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
```

 install docker-compose 

```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/docker-compose-install.sh | sudo sh
```

### install nginx

```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/nginx-install.sh | sudo sh
```

### install kubernetes 

```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/kubernetes-install.sh | sudo sh
```
- after installation, you should manually initial or join a k8s cluster
```
kubeadm init  --kubernetes-version=v1.16.2 --apiserver-advertise-address=192.168.0.4 --pod-network-cidr=10.244.0.0/16 --service-cidr=10.1.0.0/16
```
