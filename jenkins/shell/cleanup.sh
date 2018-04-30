#!/bin/bash

JENKINS_PID=`ps -aux | grep "[j]ava -jar jenkins.war --httpPort=8080" | awk '{ print $2 }'`
if [ ! -z "$JENKINS_PID" ]; then
  echo '[INFO] Killing current jenkins process...'
  kill $JENKINS_PID
  echo '[INFO] Killing current jenkins process... OK'
fi

echo '[INFO] Cleaning up jenkins setup...'
rm -rf $HOME/.jenkins jenkins.war
echo '[INFO] Cleaning up jenkins setup... OK'
