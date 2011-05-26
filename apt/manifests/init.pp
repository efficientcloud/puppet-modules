class apt {
  package { "aptitude":
    ensure => installed,
  }

  file { "/etc/apt/apt.conf":
    source => "puppet:///modules/apt/apt.conf",
    mode   => 0644,
    owner  => root,
    group  => root,
    ensure => present,
  }

  file { "/etc/apt/sources.list":
    source => "puppet:///modules/apt/sources.list",
    mode   => 0644,
    owner  => root,
    group  => root,
    ensure => present,
  }

}

class apt::unattendedupgrades {
  package { "unattended-upgrades":
    ensure => installed,
  }

  file { "/etc/apt/apt.conf.d/50unattended-upgrades":
    source => "puppet:///modules/apt/unattended-upgrades",
    mode   => 0644,
    owner  => root,
    group  => root,
    ensure => present, 
  }             
}
