# == Class ejabberd::service
#
# This class is meant to be called from ejabberd
# It ensure the service is running
#
class ejabberd::service {

  service { $ejabberd::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
