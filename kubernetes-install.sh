
# install aliyun mirror kubernetes repo

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF


# disable firewall
sudo systemctl stop firewalld.service | sudo systemctl disable firewalld.service 

# swapoff -a

# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# Some users on RHEL/CentOS 7 have reported issues with traffic being routed incorrectly due to iptables being bypassed. 
# You should ensure net.bridge.bridge-nf-call-iptables is set to 1 in your sysctl config
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

#替代docker pull k8s.gcr.io/kube-apiserver:v1.16.2
docker pull bluersw/kube-apiserver:v1.16.2 
docker tag bluersw/kube-apiserver:v1.16.2 k8s.gcr.io/kube-apiserver:v1.16.2

#替代docker pull k8s.gcr.io/kube-controller-manager:v1.16.2
docker pull bluersw/kube-controller-manager:v1.16.2 
docker tag bluersw/kube-controller-manager:v1.16.2 k8s.gcr.io/kube-controller-manager:v1.16.2

#替代docker pull k8s.gcr.io/kube-scheduler:v1.16.2
docker pull bluersw/kube-scheduler:v1.16.2 
docker tag bluersw/kube-scheduler:v1.16.2 k8s.gcr.io/kube-scheduler:v1.16.2

#替代docker pull k8s.gcr.io/kube-proxy:v1.16.2
docker pull bluersw/kube-proxy:v1.16.2 
docker tag bluersw/kube-proxy:v1.16.2 k8s.gcr.io/kube-proxy:v1.16.2

#替代docker pull k8s.gcr.io/pause:3.1
docker pull bluersw/pause:3.1 
docker tag bluersw/pause:3.1 k8s.gcr.io/pause:3.1

#替代docker pull k8s.gcr.io/etcd:3.3.15-0
docker pull bluersw/etcd:3.3.15-0 
docker tag bluersw/etcd:3.3.15-0 k8s.gcr.io/etcd:3.3.15-0

#替代docker pull k8s.gcr.io/coredns:1.6.2
docker pull bluersw/coredns:1.6.2 
docker tag bluersw/coredns:1.6.2 k8s.gcr.io/coredns:1.6.2

#替代 docker pull quay.io/coreos/flannel:v0.11.0-amd64
docker pull bluersw/flannel:v0.11.0-amd64 
docker tag bluersw/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64



