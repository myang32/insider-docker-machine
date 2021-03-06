# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.8.4"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box          = "windows_2016_insider"
  config.vm.communicator = "winrm"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ENV['HOME'], ENV['HOME']

  # config.vm.provision "shell", path: "scripts/update-docker-rc.ps1"
  config.vm.provision "shell", path: "scripts/create-machine.ps1", args: "-machineHome #{ENV['HOME']} -machineName insider"
  # Activate the next two lines to test LCOW
  # config.vm.provision "shell", path: "scripts/update-nightly-docker.ps1"
  # config.vm.provision "shell", path: "scripts/install-xenial-container.ps1"
  # config.vm.provision "shell", path: "scripts/install-hyperv.ps1"
  # config.vm.provision "reload"

  ["vmware_fusion", "vmware_workstation"].each do |provider|
    config.vm.provider provider do |v, override|
      v.gui = false
      v.memory = 5120
      v.cpus = 2
      v.enable_vmrun_ip_lookup = false
      v.linked_clone = true
      v.vmx["vhv.enable"] = "TRUE"
    end
  end

  config.vm.provider "virtualbox" do |v, override|
    v.gui = false
    v.memory = 4096
    v.cpus = 2
    v.linked_clone = true
    override.vm.network :private_network, ip: "192.168.99.90", gateway: "192.168.99.1"
  end

  config.vm.provider "hyperv" do |v|
    v.cpus = 2
    v.maxmemory = 4096
    v.differencing_disk = true
  end
end
