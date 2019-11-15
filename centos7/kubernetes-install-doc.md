# Kubernetes Installtion Docs

## update linux system
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/linux-update.sh | sudo sh 
```

## install docker
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/docker-install.sh | sudo sh
```

## install kubelet, kubectl ..
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/kubernetes-install.sh | sudo sh
```


初始化Kubernetes (自动配置阿里云镜像仓库)
```
kubeadm init \
    --apiserver-advertise-address=172.26.188.102 \
    --image-repository registry.aliyuncs.com/google_containers \
    --kubernetes-version v1.16.2 \
    --pod-network-cidr=10.244.0.0/16
```
初始化完成后, 会生成集群`join`的命令
```
kubeadm join 172.26.188.102:6443 --token wldbyk.0ocqsc4gqvv7fx2k \
    --discovery-token-ca-cert-hash sha256:45580515f7a2b699b4b773e867e5ee4bea4ff2ae4fd315a67ea9a9742582425b
```

Your Kubernetes control-plane has initialized successfully!

### 部署
To start using your cluster, you need to run the following as a regular user:

```
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### 部署 Network
You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/


## Install Kubernetes Dashboard
