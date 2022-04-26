#! /bin/bash

set -x
set -euo pipefail
#------------------------------------------------------------------------------------
# spinup vagrant cluster
vagrant box update
vagrant up

export VAULT_ADDR='http://127.0.0.1:8200'


#update the vagrant cluster
#vagrant ssh vault-node -- -t 'sudo swapoff -a && sudo systemctl restart kubelet'
#------------------------------------------------------------------------------------
echo "*** vault-node is ready to use ****"

