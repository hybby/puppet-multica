# == Class: dns
#
# Sets up "mock dns" in host file for our Vagrant setup
class dns {
  file { '/etc/hosts':
    ensure  => file,
    content => template('dns/hosts.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
