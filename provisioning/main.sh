#!/bin/bash

# stop on first error
set -e

# install utils
sudo yum install -y epel-release # fedora packages for htop etc.
sudo yum install -y htop wget nmap sudo vim # helpfull tools

# download required resources (java, hadoop)
/vagrant/provisioning/download_files.sh localhost:8000

# java 8
sudo /vagrant/provisioning/setup_java.sh

# setup hadoop
sudo /vagrant/provisioning/setup_hadoop.sh