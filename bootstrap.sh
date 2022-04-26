#! /bin/bash

set -x
set -euo pipefail
#------------------------------------------------------------------------------------
# spinup vagrant cluster
vagrant box update
vagrant up

export VAULT_ADDR='http://127.0.0.1:8200'

echo "*** vault-node is ready to use ****"
#------------------------------------------------------------------------------------
