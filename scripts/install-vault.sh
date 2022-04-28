#!/usr/bin/env bash

echo "starting..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get update -y && sudo apt-get install vault -y
mkdir -p /etc/vault.d/

echo "configuring vault..."
cat <<EOF > /etc/vault.d/vault.hcl
ui = true

#mlock = true
#disable_mlock = true

storage "file" {
path = "/opt/vault/data"
}

#storage "consul" {
# address = "127.0.0.1:8500"
# path = "vault"
#}

#HTTP listener
listener "tcp" {
address = "0.0.0.0:8200"
tls_disable = 1
}

# HTTPS listener
# listener "tcp" {
# address = "0.0.0.0:8200"
# tls_cert_file = "/opt/vault/tls/tls.crt"
# tls_key_file = "/opt/vault/tls/tls.key"
# }

# telemetry {
#   statsite_address = "127.0.0.1:8125"
#   disable_hostname = true
# }

EOF

export VAULT_SKIP_VERIFY=true

sudo systemctl start vault
sudo systemctl enable vault
sudo systemctl status vault

echo "vault up & running..."