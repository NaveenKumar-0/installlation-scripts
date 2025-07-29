#!/bin/bash
sudo apt update
sudo apt install openjdk-17-jdk -y
sudo apt update
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
sudo systemctl status jenkins | grep 'enabled' | echo "jenkins server started"
echo "java version : $(java -version 2>&1 |  head -n 1 )
echo "jenkins version : $(curl -sI http://localhost:8080 | grep -i 'X-Jenkins:' | awk '{print $2}')"
echo "jenkins password is: $(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)"
