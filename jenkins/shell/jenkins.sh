#!/bin/bash

# Aqui, seguimos o tutorial de instalação básica do jenkins do site oficial:

check_package() {
  binary_path=$1
  program_name=$2
  if [ ! -f "$binary" ]; then
    echo "[INFO] Installing $program_name..."
    sudo yum install -y --nogpgcheck $program_name
    if [ $? == 0 ]; then
      echo '[INFO] done.'
    else
      echo '[ERROR] could not install package.'
      exit 1
    fi
  fi
}

echo '[INFO] Checking if wget is installed...'
check_package /usr/bin/wget wget
echo '[INFO] Checking if wget is installed... OK'

echo '[INFO] Checking if java is installed...'
check_package /usr/bin/java java-1.8.0-openjdk
echo '[INFO] Checking if java is installed... OK'

echo '[INFO] Checking if net-tools is installed...'
check_package /usr/bin/netstat net-tools
echo '[INFO] Checking if net-tools is installed... OK'

echo '[INFO] Downloading jenkins.war...'
if [ ! -f ./jenkins.war ]; then
  wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war > /dev/null 2>&1
  echo '[INFO] done.'
else
  echo '[INFO] jenkins.war already exists. Skipping...'
fi

echo '[INFO] Checking if jenkins default port is available...'
netstat -lnptu 2>/dev/null | grep 8080 > /dev/null

if [ $? == 0 ]; then
  echo '[ERROR] jenkins default port is already in use'
  exit 1
fi

echo '[INFO] Running jenkins...'
java -jar jenkins.war --httpPort=8080 >/dev/null 2>&1 &
JENKINS_PID=$!

echo '[INFO] please browse to http://localhost:8080 to access your jenkins instance.'

echo '[INFO] Use the following admin password for your initial setup:'
while [ ! -f $HOME/.jenkins/secrets/initialAdminPassword ]; do
  true
done
printf "\t %s\n" `cat $HOME/.jenkins/secrets/initialAdminPassword`

echo '[INFO] Follow the instructions in the web page to complete the installation.'
echo
echo "[INFO] To stop jenkins, run \$ kill $JENKINS_PID"
