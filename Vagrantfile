IP_NW="192.168.10."
IP_START=10

Vagrant.configure("2") do |config|
    # config.vm.provision "shell", inline: <<-SHELL
    #     echo "$IP_NW$((IP_START))  vault-node" >> /etc/hosts
    #     echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    #     echo "nameserver 8.8.4.4" >> /etc/resolv.conf
    # SHELL
    # config.vm.box = "bento/ubuntu-21.10"
    config.vm.box = "davekpatrick/ubuntu-2204"
    config.vm.box_check_update = true

    config.vm.define "vault" do |master|
      master.vm.hostname = "vault"
      # master.vm.network "private_network", ip: IP_NW + "#{IP_START}"
      # config.vm.network "public_network", bridge: "en0: Wi-Fi"
      master.vm.provider "virtualbox" do |vb|
          # vb.customizvae ["modifyvm", :id, "--natdnshostresolver1", "on"]
          vb.memory = 4048
          vb.cpus = 2
      end
      config.vm.provision :shell, path: "common.sh"
      config.vm.network :forwarded_port, guest: 80, host: 4567,
      config.vm.network :forwarded_port, guest: 8200, host: 8200,
      config.vm.network :forwarded_port, guest: 8201, host: 8201, 
        auto_correct: true
    end
    
  end