# system update
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/linux-update.sh | sudo sh 

# install docker 
curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/docker-install.sh | sudo sh

sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://c8zb9ksc.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload

# install kubernetes 

curl -sSL https://raw.githubusercontent.com/KalibGao/ShellScripts/master/kubernetes-install.sh | sudo sh



