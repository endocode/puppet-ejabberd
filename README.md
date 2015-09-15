# puppet-ejabberd
test
[![Build Status](https://travis-ci.org/endocode/puppet-ejabberd.svg?branch=master)](https://travis-ci.org/endocode/puppet-ejabberd)

Puppet module for deploying an ejabberd instance.

Usage:

*(with default settings & internal authentication)*
    
    include ejabberd

*To use with ldap:*

    class { '::ejabberd':
        admin           => 'admin',
        hostname        => 'example.org',
        watchdog_admins => 'admin@example.org',
        c2s_certfile    => '/etc/ejabberd/ejabberd.pem',
        auth_method     => 'ldap',
        ldap_server     => 'example.org',
        ldap_encrypt    => 'tls',
        ldap_port       => '636',
        ldap_rootdn     => 'dc=example,dc=org',
        ldap_password   => 'password',
        ldap_base       => 'dc=example,dc=org',
    }

##Testing

run rspec tests: `bundle exec rake test`

run acceptance tests: `bundle exec rake acceptance`
( vagrant and virtualbox are required to run this)

###Vagrant

running `vagrant up` creates a debian wheezy and ubuntu trusty box.
`vagrant up ubuntu` or `vagrant up debian` will run only the specified box.

## Requirements

ruby > 1.9.0
puppet > 3.0
