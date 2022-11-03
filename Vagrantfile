VM_BOX="bento/ubuntu-22.04"
IP_NW="192.168.10.10"

Vagrant.configure("2") do |config|
    # SHELL
    config.vm.box=VM_BOX
    config.vm.box_check_update = true

    config.vm.define "vault" do |vault|
      vault.vm.hostname = "vault"
      vault.vm.network "private_network", ip: IP_NW"
      # config.vm.network "public_network", bridge: "en0: Wi-Fi"
      vault.vm.provider "virtualbox" do |vb|
          # vb.customizvae ["modifyvm", :id, "--natdnshostresolver1", "on"]
          vb.memory = 4048
          vb.cpus = 2
      end
      config.vm.provision "shell", path: "scripts/install-vault.sh"
      config.vm.network :forwarded_port, guest: 8500, host: 8500, auto_correct: true
      config.vm.network :forwarded_port, guest: 8200, host: 8200, auto_correct: true
      config.vm.network :forwarded_port, guest: 8201, host: 8201, auto_correct: true
    end
  end