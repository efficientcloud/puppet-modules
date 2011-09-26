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

	file { "/etc/locale.gen":
		ensure => file,
		mode => 0644,
		owner => root,
		group => root,
		content => "en_US.UTF-8 UTF-8\nde_AT.UTF-8 UTF-8\n",
		notify => Exec["fix-locales"],
	}

	exec { "fix-locales":
		command => "locale-gen && update-locale LANG=en_US.UTF-8",
		refreshonly => true,
		path => "/bin:/usr/bin:/sbin:/usr/sbin",
	}
}
