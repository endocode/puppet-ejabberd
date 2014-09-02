puppet-ejabberd
===============

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
