# == Class ejabberd::params
#
# This class is meant to be called from ejabberd
# It sets variables according to platform
#
class ejabberd::params {
  case $::osfamily {
    'Debian': {
      $package_name     = 'ejabberd'
      $service_name     = 'ejabberd'
      $config_file      = '/etc/ejabberd/ejabberd.cfg'
      $admin            = 'admin'
      $hostname         = 'localhost'
      $watchdog_admins  = 'admin@localhost'
      $c2s_certfile     = '/etc/ejabberd/ejabberd.pem'
      $s2s_enable       = false
      $auth_method      = 'internal'
      $ldap_server      = ''
      $ldap_encrypt     = ''
      $ldap_port        = ''
      $ldap_rootdn      = ''
      $ldap_password    = ''
      $ldap_base        = ''
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
