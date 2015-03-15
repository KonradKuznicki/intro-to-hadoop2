#!/bin/bash

# dir for all of it
mkdir -p /opt/yarn
cd /opt/yarn

# decompress hadoop 
tar -xf /vagrant/hadoop-2.6.0.tar.gz

# hadoop group and users
groupadd hadoop
useradd -g hadoop yarn
useradd -g hadoop hdfs
useradd -g hadoop mapred

# folders 
mkdir -p /var/data/hadoop/hdfs/nn
mkdir -p /var/data/hadoop/hdfs/snn
mkdir -p /var/data/hadoop/hdfs/dn
chown -R hdfs:hadoop /var/data/hadoop/hdfs
mkdir -p /var/log/hadoop/yarn
chown -R yarn:hadoop /var/log/hadoop/yarn 

# logs
cd /opt/yarn/hadoop-2.6.0
mkdir -p logs
chmod g+w logs
chown -R yarn:hadoop .

# copy configs
cp /vagrant/provisioning/configs/* /opt/yarn/hadoop-2.6.0/etc/hadoop/


# format hdfs
sudo su - hdfs -c "/opt/yarn/hadoop-2.6.0/bin/hdfs namenode -format"

# copy start and stop daemons
sudo su - vagrant -c "cp /vagrant/provisioning/files/start.sh ~/"
sudo su - vagrant -c "cp /vagrant/provisioning/files/stop.sh  ~/"


