
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



