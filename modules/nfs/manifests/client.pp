# == Class: nfs::client
#
# Sets up nfs to mount a shared filesystem
class nfs::client {
  $nfs_server     = 'nfs.hybby.com'
  $nfs_server_dir = '/srv/puppetssl'
  $nfs_mount_dir  = '/etc/puppet/ssl'

  file { $nfs_mount_dir:
    ensure => directory,
    mode   => '0755',
    owner  => 'puppet',
    group  => 'puppet',
    notify => Mount[$nfs_mount_dir],
  }

  mount { $nfs_mount_dir:
    device  => "${nfs_server}:${nfs_server_dir}",
    fstype  => 'nfs',
    ensure  => mounted,
    atboot  => true,
    options => 'defaults',
    require => File[$nfs_mount_dir],
  }
}
