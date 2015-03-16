#!/bin/bash

cd /vagrant


if [ -z "$1" ] # pass my machine's ip. If it doesn't work just run without parameteres
then
	# get Java 8
	wget --no-cookies --no-check-certificate --no-verbose --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.rpm"

	# get hadoop 2.6
	wget http://ftp.piotrkosoft.net/pub/mirrors/ftp.apache.org/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz --no-verbose
else
	wget $1/jdk-8u40-linux-x64.rpm --no-verbose
	wget $1/hadoop-2.6.0.tar.gz --no-verbose
fi
