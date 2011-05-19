class local {
	file { "/etc/motd":
		ensure => file,
		mode => 0644,
		owner => root,
		group => root,
		content => "Efficient Laboratories\n",
	}


	file { "/etc/default/bootlogd":
		ensure => file,
		mode => 0644,
		owner => root,
		group => root,
		content => "BOOTLOGD_ENABLE=Yes\n",
	}

	package { "psmisc":
		ensure => installed,
	}
}
