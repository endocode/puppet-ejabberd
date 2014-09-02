# == Class ejabberd::config
#
# This class is called from ejabberd
#
class ejabberd::config {
  file { $ejabberd::config_file:
    content => template('ejabberd/ejabberd.cfg.erb'),
    notify  => Service[$ejabberd::service_name]
  }
}
