FROM centos:centos6

MAINTAINER nigelpoulton@hotmail.com

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y npm

# Create $HOME/src1 folder
mkdir -p $HOME/src1

# Copy app to $HOME/src1
COPY . $HOME/src1

# Install app and dependencies into $HOME/src1
RUN cd $HOME/src1; npm install

EXPOSE 8080

CMD cd $HOME/src1 && node ./app.js