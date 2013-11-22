# == Class skyline::params
#
# This class is meant to be called from skyline
# It sets variables according to platform
#
class skyline::params {

  $oculus_host = ''
  $graphite_host = ''
  $carbon_port = 2003
  $horizon_ip = '127.0.0.1'
  $webapp_ip = '127.0.0.1'
  $webapp_port = 1500

  case $::osfamily {
    'Debian': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
