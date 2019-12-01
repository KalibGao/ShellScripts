HELM_VERSION=v3.0.0
sudo wget https://kukda-k8s-tools.oss-cn-zhangjiakou.aliyuncs.com/helm-$HELM_VERSION-linux-amd64.tar.gz
sudo tar -zxvf helm-$HELM_VERSION-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm