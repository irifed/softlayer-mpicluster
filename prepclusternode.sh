#! /bin/bash -x

source globals

# install necessary packages
apt-get update
apt-get install -y build-essential
apt-get install -y openssh-server openssh-client
apt-get install -y openmpi-bin openmpi-doc libopenmpi-dev
apt-get install -y nfs-common nfs-kernel-server

# configure cluster software
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
adduser --disabled-password --gecos "" $USER

# enable passwordless ssh between cluster nodes for user $USER
#Dima -- the code below does not work if you're logged in as root because your home dir is typically /root, 
# not /home/root
#mkdir /home/$USER/.ssh
#chmod 0700 /home/$USER/.ssh
#ssh-keygen -t rsa -b 2048 -f /home/$USER/.ssh/id_rsa -q -N ""
#cat /home/$USER/.ssh/id_rsa.pub >> /home/$USER/.ssh/authorized_keys
#chmod 0600 /home/$USER/.ssh/authorized_keys
#chown -R $USER:$USER /home/$USER/.ssh

mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -q -N ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
chmod 0600 $HOME/.ssh/authorized_keys
chown -R $USER:$USER $HOME/.ssh
