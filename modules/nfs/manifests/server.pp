# == Class: nfs::server
#
# Sets up nfs to serve a shared filesystem
class nfs::server {
  package { 'nfs-kernel-server':
    ensure => 'latest',
  }

  $nfs_dir = '/srv/puppetssl'

  file { $nfs_dir:
    ensure => directory,
    mode   => '0755',
    owner  => 'puppet',
    group  => 'puppet',
  }

  file { '/etc/exports':
    ensure => file,
    content => template('nfs/exports.erb'),
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    notify => Service['nfs-kernel-server'],
  }

  service { 'nfs-kernel-server':
    ensure  => 'running',
    enable  => 'true',
    require => File[$nfs_dir],
  }
}
