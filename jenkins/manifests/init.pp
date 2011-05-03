# vim:set syntax=puppet tw=0 ts=2 sts=2:
class jenkins::master {

	package { "jenkins":
		ensure => installed
	}

	file { "/etc/apt/sources.list.d/jenkins.list":
		source => "puppet:///modules/jenkins/apt.list",
		mode   => 0644,
		owner  => root,
		group  => root,
		ensure => present,
	}

	augeas { "jenkins-set-args" :
		context => "/files/etc/default/jenkins",
		changes => [
			"set HTTP_PORT -1",
			"set AJP_PORT -1",
#'set JENKINS_ARGS "--webroot=/var/run/jenkins/war --httpPort=\$HTTP_PORT --ajp13Port=\$AJP_PORT --httpsPort=9443"',
			]
	}
}

