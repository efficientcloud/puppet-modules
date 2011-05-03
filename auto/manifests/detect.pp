class auto::detect {
  package { "lsb-release": ensure => installed }
  include auto::os
  include auto::virtual
  include local
}
