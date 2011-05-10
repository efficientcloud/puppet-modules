class auto::virtual {
  case $virtual {
    "openvzve": { include auto::virtual::openvzve }
    "physical": { include auto::virtual::physical } 
  }
}

class auto::virtual::openvzve {
  include openvz::container
}

class auto::virtual::physical {
	package { "acpid":
		ensure => installed,
	}
}
