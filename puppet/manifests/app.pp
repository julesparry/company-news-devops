import "base.pp"

class app inherits base {

$prevayler_path = "/var/db/prevayler"

package { "tomcat6":
	ensure => "installed",
}

file { "/var/db/prevayler":
	ensure => "directory",
	owner => "tomcat",
	require => Package["tomcat6"]
}

file { "/etc/tomcat6/tomcat6.conf": 
	ensure => "present",
	content => template("tomcat6.conf.erb"),
	require => Package["tomcat6"],	
}

}

include app
