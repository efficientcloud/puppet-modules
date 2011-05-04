class local {
	file { "/etc/motd":
		ensure => file,
		mode => 0644,
		owner => root,
		group => root,
		content => "Efficient Laboratories\n",
	}

	package { ["acpid", "psmisc"]:
		ensure => installed,
	}
}
