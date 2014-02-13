package { 'apache2':
	ensure => 'present',
}

file { 'site-config':
	path => "/etc/apache2/sites-enabled/000-default",
	source => "/vagrant/site-config",
	require => Package["apache2"],
}

service { 'apache2':
	ensure => 'running',
	hasrestart => true,
	subscribe => File["site-config"],
}

file { '/vagrant/index.html':
	content => "<h1> Vagrant + Puppet </h1>",
}
