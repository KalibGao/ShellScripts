su
# ------------update centos  --------------
dnf install -y epel-release
dnf update -y

# install commonly used tools 
dnf install -y wget

# ------------------- pre-environment ----------------

# disable firewall
systemctl stop firewalld.service
systemctl disable firewalld.service

# swapoff
swapoff -a

# ------------------- install container: docker -----------------

# please check latest version of containerd https://download.docker.com/linux/centos/7/x86_64/stable/Packages/
# dnf install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
dnf install -y --nogpgcheck https://linux-packages.oss-cn-zhangjiakou.aliyuncs.com/centos8/docker/containerd.io-1.2.6-3.3.el7.x86_64.rpm

yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

dnf install -y docker-ce

mkdir /etc/docker

# Setup daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://c8zb9ksc.mirror.aliyuncs.com"],
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

# Restart Docker
systemctl daemon-reload
systemctl restart docker


# ------------------- install aliyun mirror kubernetes -----------------

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


modprobe overlay
modprobe br_netfilter

# Some users on RHEL/CentOS 7 have reported issues with traffic being routed incorrectly due to iptables being bypassed. 
# You should ensure net.bridge.bridge-nf-call-iptables is set to 1 in your sysctl config, e.g.

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system



# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

systemctl enable --now kubelet


# ------------------- run kubernetes -----------------

kubeadm init \
    --image-repository registry.aliyuncs.com/google_containers \
    --kubernetes-version v1.17.2 \
    --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
