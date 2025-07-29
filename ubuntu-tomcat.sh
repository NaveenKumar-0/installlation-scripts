#! /bin/bash
sudo apt update
apt install openjdk-17-jdk -y
sudo apt update
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.107/bin/apache-tomcat-9.0.107.tar.gz
tar -zxvf apache-tomcat-9.0.107.tar.gz
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.107/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.107/conf/tomcat-users.xml
sed -i '58  a\<role rolename="manager-status"/>' apache-tomcat-9.0.107/conf/tomcat-users.xml
sed -i '59  a\<user username="admin" password="naveen" roles="manager-gui, manager-script, manager-status"/>' apache-tomcat-9.0.107/conf/tomcat-users.xml
sed -i '60  a\</tomcat-users>' apache-tomcat-9.0.107/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-9.0.107/conf/tomcat-users.xml
sed -i '21d' apache-tomcat-9.0.107/webapps/manager/META-INF/context.xml
sed -i '22d'  apache-tomcat-9.0.107/webapps/manager/META-INF/context.xml
sh apache-tomcat-9.0.107/bin/startup.sh
