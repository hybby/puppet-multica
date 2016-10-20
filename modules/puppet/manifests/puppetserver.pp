# == Class: puppet::puppetserver
#
# install and configure puppetserver
class puppet::puppetserver {
  $puppet_conf = '/etc/puppet/puppet.conf'

  package { 'puppetserver':
    ensure => 'installed',
  }

  ini_setting { 'configure dns_alt_names':
    ensure  => 'present',
    section => 'main',
    path    => $puppet_conf,
    setting => 'dns_alt_names',
    value   => "${hostname},${fqdn},puppet.hybby.com"
  }

  ini_setting { 'remove templatedir':
    ensure  => absent,
    section => 'main',
    path    => $puppet_conf,
  }
}
