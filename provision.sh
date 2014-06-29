#! /bin/bash

set -o xtrace

# provision N CCIs on SoftLayer from image id `imageid`
N=1

cpu=1
memory=1024

datacenter="ams01"

domain="mpi-irina.com"
hostname="node"

#os="UBUNTU_14_64"
imageid="36394767-5d9f-4a07-b399-ed4023847a07"
key="irina@ru.ibm.com"

for ((i=1; i<=${N}; i++)); do
    hostname="${hostname}${i}"
    sl cci create -y --hourly \
        --datacenter=${datacenter} \
        --cpu=${cpu} --memory=${memory} \
#        --os=${os} \
        --image=${imageid} \
        --domain=${domain} --hostname=${hostname} --key=${key} 
    #--test
done

