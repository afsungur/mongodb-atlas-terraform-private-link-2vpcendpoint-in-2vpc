  #! /bin/bash
  sudo yum update -y
  sudo echo "[mongodb-enterprise-6.0]" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo echo "name=MongoDB Enterprise Repository" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo echo "baseurl=https://repo.mongodb.com/yum/amazon/2/mongodb-enterprise/6.0/x86_64/" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo echo "gpgcheck=1" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo echo "enabled=1" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo echo "[mongodb-enterprise-6.0]" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo echo "gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc" >> /etc/yum.repos.d/mongodb-enterprise-6.0.repo
  sudo yum install -y mongodb-enterprise
