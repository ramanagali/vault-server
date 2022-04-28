# Vault Server Using Vagrant

Vault Server using vagrant, virtual box and ubuntu 22.04

## Create Ubuntu, Install Vault using Vagrant & VirtualBox

### 1. Prerequisites (Mandatory)
* Install Brew using https://brew.sh/
* Install virutalbox using `brew install --cask virtualbox`         
  * follow steps https://www.virtualbox.org/wiki/Downloads
* Install vagrant using `brew install vagrant`
  * https://www.vagrantup.com/docs/installation

### 2. Mandatory Step for MacOS Monterey
Bun below...
```sh
sudo mkdir -p /etc/vbox/
echo * 0.0.0.0/0 ::/0 | sudo tee -a /etc/vbox/networks.conf
```

### 3. Checkout the Repo
Clone the repo locally by running below command 
  
```sh 
git clone the repo https://github.com/ramanagali/vault-server.git
cd vault-server
```

### 4. Bootstrapping k8s cluster using shell script
Run below command to provision new vault server

```sh
./bootstrap.sh
```

### 5. Access vault server from browser

http://localhost:8200

```sh
export VAULT_ADDR='http://127.0.0.1:8200'
```

#### 6. Stop vault server

```sh
vagrant halt
```

#### 10. Cleanup k8s cluster
```sh
vagrant destroy -f
```


## Workaround for hrome allow vault SSL cert (if vault running in https)

- Right click, select inspect element
- click on console tab
- Copy paste sendCommand(SecurityInterstitialCommandId.CMD_PROCEED) 
- press Enter

