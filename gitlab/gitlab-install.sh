sudo yum install -y curl policycoreutils-python openssh-server

sudo systemctl enable sshd

# sudo firewall-cmd --permanent --add-service=http
# sudo firewall-cmd --permanent --add-service=https
# sudo systemctl reload firewalld


# sudo yum install -y postfix
# sudo systemctl enable postfix
# sudo systemctl start postfix

#curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash

sudo EXTERNAL_URL="https://gitlab.360lyq.com" yum install -y gitlab-ce