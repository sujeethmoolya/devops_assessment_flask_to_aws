#!/bin/bash
sudo apt-get update
yes | sudo apt install openjdk-21-jdk-headless
echo "Waiting for 30 seconds before installing the jenkins package..."
sleep 30
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
yes | sudo apt-get install jenkins
sleep 30
echo "Waiting for 30 seconds before installing the Terraform..."
latest_terraform=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep "browser_download_url.*linux_amd64.zip" | cut -d '"' -f 4)
wget $latest_terraform -O terraform_latest.zip
yes | sudo apt-get install unzip
unzip terraform_latest.zip
sudo mv terraform /usr/local/bin/