# ShellScripts Experiment

## sh 脚本
- 脚本要求无用户中断, 例如 `yum update -y ...`, `yum install -y ...`

## K8s 

### k8s 16.2 安装docker v19.03 , 却被要求v18.06


cat <<EOF >> /etc/hosts

172.26.188.102 k8s-node1
172.26.188.103 k8s-node2
172.26.188.104 k8s-node3
EOF