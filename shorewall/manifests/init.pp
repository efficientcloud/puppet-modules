class shorewall {
    package { "shorewall":
        ensure => installed,
    }
    file { "/etc/shorewall":
        ensure  => directory,
        require => Package["shorewall"],
	recurse => true,
	purge => true,
    }

    file { "/etc/default/shorewall": source => "puppet:///modules/shorewall/shorewall.default" }
    file { "/etc/shorewall/shorewall.conf": source => "puppet:///modules/shorewall/shorewall.conf" }
}


class shorewall::efc inherits shorewall {
    File { 
        owner => "root",
        group => "root",
        mode  => 0640,
    }
    file { "/etc/shorewall/params": source => "puppet:///modules/shorewall/efc/params" }
    file { "/etc/shorewall/policy": source => "puppet:///modules/shorewall/efc/policy" }
    file { "/etc/shorewall/routestopped": source => "puppet:///modules/shorewall/efc/routestopped" }
    file { "/etc/shorewall/common-rules": source => "puppet:///modules/shorewall/efc/common-rules" }

    # might be host-specific
    file { "/etc/shorewall/interfaces": source => ["puppet:///modules/shorewall/efc/interfaces.$hostname", "puppet:///modules/shorewall/efc/interfaces"] }
    file { "/etc/shorewall/zones": source => ["puppet:///modules/shorewall/efc/zones.$hostname", "puppet:///modules/shorewall/efc/zones"] }
    file { "/etc/shorewall/rules": source => ["puppet:///modules/shorewall/efc/rules.$hostname", "puppet:///modules/shorewall/efc/rules"] }
}
