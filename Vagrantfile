# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # => vagrant plugin install vagrant-proxyconf
  if Vagrant.has_plugin?("vagrant-proxyconf")
    has_proxy = false
    if ENV.has_key?('http_proxy') and !ENV['http_proxy'].empty?
      config.proxy.http = ENV['http_proxy']
      has_proxy = true
    end
    if ENV.has_key?('https_proxy') and !ENV['https_proxy'].empty?
      config.proxy.https = ENV['https_proxy']
      has_proxy = true
    end
    if has_proxy
      config.proxy.no_proxy = "localhost,127.0.0.1"
    end
  end

  config.vm.synced_folder ".", "/etc/puppet/modules/ejabberd/"

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.provision "shell", inline: 'apt-get update && apt-get install -y puppet'
    ubuntu.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "init.pp"
      puppet.options = ['--verbose', "-e 'class { 'ejabberd': }'"]
    end
  end
  
  config.vm.define "debian" do |debian|
    debian.vm.box = "puppetlabs/debian-7.8-64-puppet"
    debian.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "init.pp"
      puppet.options = ['--verbose', "-e 'class { 'ejabberd': }'"]
    end
  end
end