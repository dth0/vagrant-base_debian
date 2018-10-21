# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #config.vm.box = "debian-custom"
  config.vm.box = "debian/contrib-testing64"
  config.vm.box_check_update = false
  config.vm.synced_folder './', '/vagrant', type: 'rsync'

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = :host
  end

  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.compatibility_mode = "2.0"
  end

  config.vm.provider :libvirt  do |libvirt|
      libvirt.cpus = 4
      libvirt.memory = 4096
      libvirt.nested = true
      libvirt.graphics_type = "spice"
      libvirt.video_type = "qxl"
  end

  config.vm.define "base" do |base|
      base.vm.hostname = "base.theodoro.local"
  end
end
