#! /bin/bash

set -x
set -euo pipefail
#------------------------------------------------------------------------------------
# spinup vagrant cluster
vagrant box update
vagrant up

#update the vagrant cluster
#vagrant ssh vault-node -- -t 'sudo swapoff -a && sudo systemctl restart kubelet'
#------------------------------------------------------------------------------------
echo "*** vault-node is ready to use ****"
