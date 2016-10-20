node default {
  include ::dns
  include ::puppet::repos
}

node /^puppet-\w+\.hybby\.com$/ {
  include ::nfs::client
  include ::puppet::puppetserver
  include ::puppet::repos
  include ::dns
}

node 'nfs.hybby.com' {
  include ::nfs::server
  include ::puppet::repos
  include ::dns
}
