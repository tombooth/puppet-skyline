# == Class skyline::config
#
# This class is called from skyline
#
class skyline::config {

  file { '/opt/skyline/src/settings.py':
    ensure  => present,
    content => template('skyline/settings.py.erb'),
    notify  => Class['skyline::service'],
  }

}
