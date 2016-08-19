#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM ubuntu

MAINTAINER by j "451516645@qq.com"

ADD hosts /etc/ 
ADD sources.list /etc/apt/
ADD authorized_keys /root/.ssh/

# Upgrade package index  
RUN apt-get update  
RUN apt-get install -y less iputils-ping net-tools vim-tiny sudo openssh-server

ENV JAVA_HOME /home/by-j/app/jdk1.8.0_101
ENV SCALA_VERSION 2.10.4
ENV SPARK_VERSION 2.0.0
ENV HADOOP_VERSION 2.6.0
ENV HADOOP_HOME /home/by-j/app/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_HOME/lib"
ENV HADOOP_PREFIX $HADOOP_HOME
ENV SQOOP2_HOME /home/by-j/app/sqoop-1.99.6-bin-hadoop200
ENV CATALINA_BASE $SQOOP2_HOME/server
ENV LOGDIR $SQOOP2_HOME/logs/
ENV M2_HOME /home/by-j/app/apache-maven-3.2.2
ENV SCALA_HOME /home/by-j/app/scala-$SCALA_VERSION
ENV SPARK_HOME /home/by-j/app/spark-$SPARK_VERSION-bin-hadoop2.6
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/
ENV PATH $JAVA_HOME/bin:$JAVA_HOME/jre/bin:$SCALA_HOME/bin:$M2_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SQOOP2_HMOE/bin:$PATH

# ssh no passwd login
#RUN mkdir -p  /var/run/sshd
#RUN sed  -ri 's/session  required  pam_loginuid.so/#session  required  pam_loginuid.so/g' /etc/pam.d/sshd
#RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
#RUN /etc/init.d/sshd reload
#RUN /etc/init.d/sshd restart
#RUN service sshd start
#RUN /usr/sbin/sshd -D
EXPOSE 22
