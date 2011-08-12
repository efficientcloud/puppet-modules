define emailzshrc($email) {
	file { "/etc/zsh/user.rc/$name":
		ensure => "present",
		mode => 0644,
		owner => root,
		group => root,
		content => "export EMAIL=$email"
	}
}

class users {
	user { "root":
		ensure => "present",
		gid => "root",
		managehome => false,
		shell => "/bin/zsh",
		uid => "0",
	}
	
	group { "staff":
		ensure => "present",
		gid => 50,
	}

	user { "ch":
		ensure => "present",
		comment => "Christian Hofstaedtler",
		gid => "staff",
		groups => ["sudo","adm"],
		managehome => true,
		shell => "/bin/zsh",
		uid => "2001",
		require => Group["staff"],
	}
	
	ssh_authorized_key { "ch@shiny":
		user => "ch",
		key => "AAAAB3NzaC1yc2EAAAABIwAAAgEAofxbWxWtZU35kJUPYZrMi1+Zw49VmVn7sD0iqvN3xB1T6YnnBsXBYA+N/SdsA2Jsq+1cKGX87uWRn8EzDZ0IERD9lDOslb2rQ09h44bDDD0bplPuE+yOXDFWRgFOYN13I7c0O0NZ4ue1TE8I2TyWpUksbas4JgDGT/1/EsSRZJsoEXpXtvYCRwngGWVenjBxFFSo1DwwYv8yc97+cXZoOUd8F78Rb9H70GI4tshrlntXQI8vyoiIAc7lPVJYBTuENJpa/bvYysFxjpjQrpK1w7PtgM/f1F2QG9KDPsGqqfGXsMcmIrHVkl4dF/ffpYpKn4+fu0hY0O4O2y9gSU7Xi57IIGx1oX0C7eyHIctWo0z8+13n7yigU3VnigDZlK3sKZdNAekFBjuXFxbXoqf/zdESlsGVo7aL36+Hw7XSH7oexD1E+2xpNKhiF/ZY5WzzWvenNHHKHkppTKDlk00fh5ssM/F3TpclwHy6NkrkY9SV6JvT9fNp2noSGS1LH4Ee9sc88IFYp8lReSeto+LxnJxdVUhFnbfgkeqT4FSwVKp/tvv90hIX1G+4nYlcN+SijbBo4wxnBIsoGBfcwKDwdlY9J+UogNWoZmcIKaO9rFF74J2TYNnnxMPkQ7hl1hUQUanY3NPokRGA0Z0Q2Kn28lYkE6KHLUdFC9ur0t/BpWs=",
		type => "ssh-rsa",
		ensure => present,
	}

	user { "fin":
		ensure => "present",
		comment => "Markus Hameter",
		gid => "staff",
		groups => ["sudo","adm"],
		managehome => true,
		shell => "/bin/bash",
		uid => "2002",
		require => Group["staff"],
	}

	ssh_authorized_key { "fin@efficientcloud":
		user => "fin",
		key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAso41DDM+MYgeR+ixJ1XkxMHU1EUUsB3PKsxOmtnyAxInYXx64B93PR4BO7egtvcytoVNWjG9mTBopLpFize/TTO3uNrnU70IzS+Q5lKrK3Dyry1opYhb+6XEgpOgtPba5d/MPzNxgJgMNcL6vyVuNP6FP5SZ0b9oNZOMk5d8grwClRNkj3CDIrUUWoTn91wH3jLUmCA5vrw2NGxs6uzuxyKtYBOY/FiQ+c6vjl+LGvBRNaQ/K2Xw82J9OYJK0wmOTaB2Bi8dphU36IV+p7FZUv5+TuSeq8MBidZ6r0o0SA1PkPnBIH8uhnBdbpB/ntddY3/2AJ7J+BCDgQ9XKg4RFw==",
		type => "ssh-rsa",
		ensure => present,
	}

	user { "robe":
		ensure => "present",
		comment => "Michael Renner",
		gid => "staff",
		groups => ["sudo","adm"],
		managehome => true,
		shell => "/bin/zsh",
		uid => "2003",
		require => Group["staff"],
	}

	emailzshrc{ "robe":
		email => "m.renner@efficientcloud.com"
	}

	ssh_authorized_key { "robe@trottelkunde.amd.co.at":
		user => "robe",
		key => "AAAAB3NzaC1yc2EAAAABIwAAAgEA09nolxoJhcGrRn9h2r83pelm3x0Gqgds7lEcqCtQJ+vvCrRisS7D//9gSs+iN/FjBgCgR8JipucXB5Q/qzEgHmHpmQr4fn7CRVhyRzKCxSNm9NPXrTlcL+c4PXb9x5HVd7ukRcz0Tz/IB893g2dXRAQs9bwEYTOvJTWP0ucnu/6ZZw79dvGepn47ayBHSVFglYsjmLpLfQSJK6QTUsD8qdl0WvFmoALQl7CK8Zd+6ScqLN8iHmwFZ4h40FirguG4hqqKFk24YsdnZbCANzUvWDX9pl/wFcsV0TfDCggr5SSF+f+HFFlb6W8YPRrbYtQa2xHh3OBN4ub9FRKUGqEZKFwR+0bl/8xL9lcavXTKTfPlewbu0v2V5WOL+SG1/NOcmE4bO+5nB+G9xwVZIpVy2k2na/3I1PQCbwTwI47/ooGsDgsPc/k/zpUXbVRadpqCQTQFZMS7MfcDHHYEemoh7YfmKbO5glQnWafznWz0wfxTV8E3bpHskTUAd+n9UkrU85KWlCse2lawiP6K2dh42c/tatUjUws5CYBcMahxFKKNMa1NXejqcvNqLQMKhEEwfmVN53oXWWT1pxngM5n0En7cZEu/PGBiUkF9zL1vdRj4P1Z/vEMhft5A4/I0VqBEAtqo17eUTxxiFIb3id78xFiis0vuPeCrF+zKc8JRByc=",
		type => "ssh-rsa",
		ensure => present,
	}

	user { "lfittl":
		ensure => "present",
		comment => "Lukas Fittl",
		gid => "staff",
		groups => ["sudo","adm"],
		managehome => true,
		shell => "/bin/zsh",
		uid => "2004",
		require => Group["staff"],
	}

	ssh_authorized_key { "lfittl@capricorn":
		user => "lfittl",
		ensure => absent
	}
	ssh_authorized_key { "lfittl@kenkyo":
		user => "lfittl",
		key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA2fuZ0yey/pxhXaGK2tGm6Cj3aHJL2IiXIXbyUKCtRUm4FGn6x3FgYrv6TXHyPVGi4KMJ2pSx1F9WyO0C50qX2Bxgd0Pi+38CkWG8a6ERHMUSLaoX4+FLOTAdZGvMu2FgNuR3rKDxQf09nKTVv14ijR1mOQEQ+21lHE9YdcVMh1VdNA/nIjXiI1pp3CIQ024yrFwR3oGsW2JNDYSxv7jH91YxvSrlhLhdxwplhJIEuxeOkKfWa3tPWXAKaahUTC+BymR59e8e6pbcX3mbK6CaiZIrs1v/nUvLE2Z7qrT5aGY7UCl9gNUJo1p9+RVOOvSKiC7Jlj8RTGukftoHGhUjgQ==",
		type => "ssh-rsa",
		ensure => present,
	}

}


