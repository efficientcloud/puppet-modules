class monitoring::efc {


	package { "nagios-nrpe-server":
		ensure => installed,
	}

	package { "nagios-plugins-standard":
		ensure => installed,
	}

	file { "/opt/nagios/":
		ensure => "directory",
	}

	file { "/opt/nagios/check_kernel_freshness":
		source => "puppet:///modules/monitoring/check_kernel_freshness",
		ensure => "file",
		mode => 755,
	}

	file { "/opt/nagios/check_megaraid_sas":
		source => "puppet:///modules/monitoring/check_megaraid_sas",
		ensure => "file",
		mode => 755,
	}

	file { "/etc/nagios/nrpe_local.cfg":
		source => "puppet:///modules/monitoring/nrpe_local.efc",
		ensure => "file",
		notify => Exec[nrperestart],
		require => Package[nagios-nrpe-server],
	}

	exec { "/etc/init.d/nagios-nrpe-server restart":
		refreshonly => true,
		alias => nrperestart,
	}

	file { "/etc/sudoers.d/monitoring":
		ensure => "file",
		source => "puppet:///modules/monitoring/sudoers",
		mode => 440,
	}

	file { "/usr/local/sbin/MegaCli64":
		ensure => "file",
		source => "puppet:///modules/monitoring/MegaCli64",
		mode => 755,
	}
}
