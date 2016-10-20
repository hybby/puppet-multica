# == Class: puppet::repos
#
# fix bad pgp keys mostly for puppet repos
class puppet::repos {
  exec { 'apply puppetlabs key':
    command => 'apt-key adv --keyserver pgp.mit.edu --recv-keys 47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
    path    => ['/bin', '/usr/bin'],
    unless  => 'apt-key list | grep 4BD6EC30'
  }

  exec { 'apply puppetlabs inc key':
    command => 'apt-key adv --keyserver pgp.mit.edu --recv-keys 6F6B15509CF8E59E6E469F327F438280EF8D349F',
    path    => ['/bin', '/usr/bin'],
    unless  => 'apt-key list | grep EF8D349F'
  }
}
