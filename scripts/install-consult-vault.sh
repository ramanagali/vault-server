#!/usr/bin/env bash

sudo apt-get update -y
wget https://releases.hashicorp.com/consul/1.12.0/consul_1.12.0_linux_amd64.zip
unzip consul_1.12.0_linux_amd64.zip
sudo mv consul /usr/bin

LOCALIP=$(hostname -I | awk '{print $1}')

cat <<EOF > /etc/system/system/consul.service
[Unit]
Description=Consul
Documentation=https://www.consul.io/
[Service]
ExecStart=/usr/bin/consul agent -server -ui -data-dir=/temp/consul -bootstrap-expect=1 -node=vault -bind=$LOCALIP -config-dir=/etc/consul.d/
ExecReload=/bin/kill -HUP $MAINPID
LimitNOFILE=65536
[Install]
WantedBy=multi-user.target
EOF
sudo mkdir /etc/consul.d

cat <<EOF > /etc/consul.d/ui.json
{
“addresses”: {
“http”: “0.0.0.0”
}
}
EOF

systemctl daemon-reload
systemctl start consul
systemctl enable consul

apt install unzip -y
wget https://releases.hashicorp.com/vault/1.10.1/vault_1.10.1_linux_amd64.zip
unzip vault_1.10.1_linux_amd64.zip
mv vault /usr/bin
mkdir -p /etc/vault
mkdir -p /var/lib/vault/data

cat <<EOF > /etc/vault/config.hcl
storage “consul” {
address = “127.0.0.1:8500”
path = “vault/”
}

listener “tcp” {
address = “0.0.0.0”
tls_disable = 1
}

ui = true
EOF

cat <<EOF > /etc/system.system/consul.service /etc/system/system/vault.service

[Unit]
Description=Vault
Documentation=https://www.vault.io/
[Service]
ExecStart=/usr/bin/vault server -config=/etc/vault/config.hcl
ExecReload=/bin/kill -HUP $MAINPID
LimitNOFILE=65536
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start vault
systemctl enable vault
