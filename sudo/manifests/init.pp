# vim:set syntax=puppet tw=0 ts=2 sts=2:
class sudo {

	package { "sudo":
		ensure => installed
	}

	file { "/etc/sudoers.d/efficient":
		ensure => "present",
		mode => 0440,
		owner => root,
		group => root,
		source => "puppet:///modules/sudo/efficient",
		require => Package["sudo"],
	}

}

