# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = 'puppet-awscli'
  config.vm.synced_folder "modules", "/tmp/puppet-modules", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder ".", "/tmp/puppet-modules/awscli", type: "rsync", rsync__exclude: ".git/"

  config.vm.define "centos" do |centos|
    centos.vm.box     = 'puppetlabs/centos-6.6-64-puppet'
    centos.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

  config.vm.define "ubuntu", primary: true do |ubuntu|
    ubuntu.vm.box     = 'puppetlabs/ubuntu-14.04-64-puppet'
    config.vm.box_version = "1.0.1"
    ubuntu.vm.provision :shell, :inline => 'wget -qO - http://apt.puppetlabs.com/DEB-GPG-KEY-puppetlabs | sudo apt-key add -'
    ubuntu.vm.provision :shell, :inline => 'wget -qO - http://apt.puppetlabs.com/DEB-GPG-KEY-puppet | sudo apt-key add -'
    ubuntu.vm.provision :shell, :inline => 'apt-get -qq update'
    ubuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/tmp/puppet-modules"]
    end
  end

end
