#!/bin/bash

set -o xtrace

# TODO

# provision initial node for golden image creation
# run prepclusternode.sh
# capture image

# provision 1 node from image - this node will be cluster front-end and NFS master
# put master ip address to file `globals`

# provision N nodes from image - they will be MPI workers and NFS minions
# collect N ip addresses of provisioned cluster nodes to file `mpi_hosts`

# upload `globals`, `mpi_hosts`, `nfs-master.sh` to master node
# configure master node nfs master by running `nfs-master.sh`

# upload `globals`, `nfs-minion.sh` to minion nodes
# configure other nodes as nfs minions by running `nfs-minion.sh`

