# Kubernetes Installtion Docs

## auto install 
初始化Kubernetes (自动配置阿里云镜像仓库)
```
kubeadm init \
    --apiserver-advertise-address=172.26.188.103 \
    --image-repository registry.aliyuncs.com/google_containers \
    --kubernetes-version v1.16.2 \
    --pod-network-cidr=10.244.0.0/16
```

## Install Kubernetes Dashboard
