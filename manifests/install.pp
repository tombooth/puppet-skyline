# == Class skyline::install
#
class skyline::install {
  include skyline::params
  include python

  $python_packages = {
    'redis'          => { ensure => '2.7.2' },
    'hiredis'        => { ensure => '0.1.1' },
    'python-daemon'  => { ensure => '1.6' },
    'flask'          => { ensure => '0.9' },
    'simplejson'     => { ensure => '2.0.9' },
    'pandas'         => { },
    'patsy'          => { },
    'statsmodels'    => { require => Package['patsy'] },
    'msgpack_python' => { },
    'unittest2'      => { },
    'mock'           => { },
  }

  $python_package_default = {
    ensure   => installed,
    provider => pip,
    require  => Class['python'],
  }

  $system_package = [
    'python-numpy',
    'python-scipy',
    'redis-server',
    'git',
  ]

  $directories = [
    '/var/log/skyline',
    '/var/run/skyline',
    '/var/log/redis',
    '/var/dump',
  ]

  create_resources('package', $python_packages, $python_package_default)

  package { $system_package:
    ensure => installed,
  }

  vcsrepo { '/opt/skyline':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/etsy/skyline.git',
    require  => Package['git'],
  }

  file { $directories:
    ensure => directory,
  }

}
