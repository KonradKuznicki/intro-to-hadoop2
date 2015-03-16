#!/bin/bash

# install java
rpm -ivh /vagrant/jdk-8u40-linux-x64.rpm

# copy java environment variables 
cp /vagrant/provisioning/files/java.sh /etc/profile.d/

# load java environment variables 
source /etc/profile.d/java.sh
