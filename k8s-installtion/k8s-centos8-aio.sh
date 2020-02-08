# ------------update centos  --------------
sudo dnf install -y epel-release
sudo dnf update -y

# install commonly used tools 
# sudo dnf install -y wget 


# ------------------- install aliyun mirror kubernetes -----------------

sudo cat <<EOF > /etc/yum.repos.d/kubernetes.repo
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
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

# swapoff
sudo swapoff -a



sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet

# Some users on RHEL/CentOS 7 have reported issues with traffic being routed incorrectly due to iptables being bypassed. 
# You should ensure net.bridge.bridge-nf-call-iptables is set to 1 in your sysctl config
sudo cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo systemctl start kubelet