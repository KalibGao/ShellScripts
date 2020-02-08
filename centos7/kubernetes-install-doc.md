# Kubernetes Installtion Docs

## update linux system
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/centos-update.sh | sudo sh 
```

## install docker
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/docker-install.sh | sudo sh
```

## install kubelet, kubectl ..
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/kubernetes-install.sh | sudo sh
```

### 以上步骤可以合并在一起执行
```
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/kubernetes-aio-install.sh | sudo sh 
```

初始化Kubernetes (自动配置阿里云镜像仓库)
```
kubeadm init \
    --apiserver-advertise-address=172.26.188.102 \
    --image-repository registry.aliyuncs.com/google_containers \
    --kubernetes-version v1.17.2 \
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



## Install Kubernetes Addon 插件

### Networking

- 安装 `flannel`
```
# 用七牛云镜像替换国外镜像, 使用前请配置镜像版本号
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/flannel-image-install.sh | sudo sh

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# 带RBAC功能
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
```

### Dashboard

- 安装用户权限

```
kubectl apply -f https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/dashboard-adminuser.yaml 

kubectl apply -f https://raw.githubusercontent.com/KalibGao/ShellScripts/master/centos7/dashboard-adminuser-rolebinding.yaml 
```

-- 暴露给外部用户访问

```
kubectl proxy --address='0.0.0.0'  --accept-hosts='^*$' --port=8001
```

### 
