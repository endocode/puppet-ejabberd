# == Class ejabberd::install
#
class ejabberd::install {

  package { $ejabberd::package_name:
    ensure => present,
  }
}
