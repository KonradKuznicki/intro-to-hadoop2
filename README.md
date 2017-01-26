Introduction to Hadoop v2 (YARN)
================================


Requiremets
-----------
- Windows: terminal emulator with ssh like cygwin or cmder
- ssh
- GIT
- VirtualBox 4.2+
- Vagrant 1.7+
- Maven 3
- at least 4 GB of ram



Before you start
----------------

- Make sure that you have enabled virtualization support

- Make sure that GIT will not convert LF to CRLF during repo checkout
  (it will break all bash scritpts in the repo)

- Make sure that you have stable internet connection

- install Vagrant plugin

        vagrant plugin install vagrant-vbguest



Step 1: setup environment
-------------------------

1) open your favourit terminal emulator

2) checkout this repository

    git clone https://github.com/konradk2/intro-to-hadoop2

3) go to the root of freshly checked out repository

    cd intro-to-hadoop2

4) bootstrap environment (it will take a lot of time...)

    vagrant up

5) check if bootstrap succeded

previous command should end with

    ==> default: /************************************************************
    ==> default: SHUTDOWN_MSG: Shutting down NameNode at localhost/127.0.0.1
    ==> default: ************************************************************/



Step 2: run first task on your 1-machine-cluster
------------------------------------------------

1) enter the virtual machine

    vagrant ssh

2) start all hadoop daemons

    ./start.sh

3) switch user

    sudo su - hdfs

4) go to directory with hadoop binaries and start scripts

    cd /opt/yarn/hadoop-2.6.0/bin

5) run example that calculates pi

    ./yarn jar ../share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar pi 8 100

6) check status of your task on http://localhost:8088/

7) check if your task ended successfully

previous command should end with

    Job Finished in 82.653 seconds
    Estimated value of Pi is 3.13500000000000000000

8) exit virtualmachine with

    exit # to go back to vagrant user

    exit # to exit virtualmachine



Step 3: run your first MapReduce app
------------------------------------

1) go to directory with sample java code

    cd first

2) compile it

    mvn install

3) go to the virtualmachine

    vagrant ssh

4) switch user to hdfs

    sudo su - hdfs

5) go to directory with hadoop binaries and start scripts

    cd /opt/yarn/hadoop-2.6.0/bin

6) load file with some text to HDFS

    ./hdfs dfs -appendToFile /vagrant/provisioning/files/mapreduceme.txt /user/mapreduceme.txt

7) run your app

    ./hadoop jar /vagrant/first/target/first-0.0.1-SNAPSHOT.jar org.introtohadoop2.first.First /user/mapreduceme.txt /user/firstout

8) check the output of your app
- go to http://localhost:50070/
- go to Utilities -> Browse the filesystem
- click user -> firstout -> part-r-00000
- download the file
- open in your favourite editor
