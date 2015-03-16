#!/bin/bash

# stop on first error
set -e

# install java
rpm -ivh /vagrant/jdk-8u40-linux-x64.rpm

# copy java environment variables 
cp /vagrant/provisioning/files/java.sh /etc/profile.d/

# load java environment variables 
source /etc/profile.d/java.sh

# set alternatives if you have java installed already
alternatives --install /usr/bin/java java $JAVA_HOME/jre/bin/java 20000
alternatives --install /usr/bin/jar jar $JAVA_HOME/bin/jar 20000
alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000
alternatives --install /usr/bin/javaws javaws $JAVA_HOME/jre/bin/javaws 20000
alternatives --set java $JAVA_HOME/jre/bin/java
alternatives --set jar $JAVA_HOME/bin/jar
alternatives --set javac $JAVA_HOME/bin/javac 
alternatives --set javaws $JAVA_HOME/jre/bin/javaws