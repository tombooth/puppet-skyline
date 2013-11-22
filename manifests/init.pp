# == Class: skyline
#
# Full description of class skyline here.
#
# === Parameters
#
# [*graphite_host*]
#   Url of your graphite frontend (including http://)
#
# [*oculus_host*]
#   If you have oculus set up then provide its url including http://
#
# [*carbon_port*]
#   Port carbon is running on
#
class skyline (
  $graphite_host = $skyline::params::graphite_host,
  $oculus_host   = $skyline::params::oculus_host,
  $carbon_port   = $skyline::params::carbon_port,
  $horizon_ip    = $skyline::params::horizon_ip,
  $webapp_ip     = $skyline::params::webapp_ip,
  $webapp_port   = $skyline::params::webapp_port,
) inherits skyline::params {

  # validate parameters here

  anchor { 'skyline::begin': } ->
  class { 'skyline::install': } ->
  class { 'skyline::config': }
  class { 'skyline::service': } ->
  anchor { 'skyline::end': }

  Anchor['skyline::begin']  ~> Class['skyline::service']
  Class['skyline::install'] ~> Class['skyline::service']
  Class['skyline::config']  ~> Class['skyline::service']
}
