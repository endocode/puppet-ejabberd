# == Class: ejabberd
#
class ejabberd (
  $admin            = $ejabberd::params::admin,
  $hostname         = $ejabberd::params::hostname,
  $watchdog_admins  = $ejabberd::params::watchdog_admins,
  $c2s_certfile     = $ejabberd::params::c2s_certfile,
  $s2s_enable       = $ejabberd::params::s2s_enable,
  $auth_method      = $ejabberd::params::auth_method,
  $ldap_server      = $ejabberd::params::ldap_server,
  $ldap_encrypt     = $ejabberd::params::ldap_encrypt,
  $ldap_port        = $ejabberd::params::ldap_port,
  $ldap_rootdn      = $ejabberd::params::ldap_rootdn,
  $ldap_password    = $ejabberd::params::ldap_password,
  $ldap_base        = $ejabberd::params::ldap_base,
  $ldap_uids        = $ejabberd::params::ldap_uids,
  $ldap_filter      = $ejabberd::params::ldap_filter
) inherits ejabberd::params {

  class { 'ejabberd::install': } ->
  class { 'ejabberd::config': } ~>
  class { 'ejabberd::service': } ->
  Class['ejabberd']
}
