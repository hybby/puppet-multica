# == Class: puppet::agent.pp
#
# install and configure puppet agent
class puppet::puppetserver {
  package { 'puppet':
    ensure => 'latest',
  }
}
