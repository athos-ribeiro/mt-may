class dockersetup {

	package { 'docker':
		ensure => present,
	}

	service { 'docker':
		ensure   => running,
		provider => 'systemd',
		enable   => true,
		require  => Package['docker'],
	}

	group { 'docker':
		ensure => present,
	}

	user { 'vagrant':
		groups => 'docker',
	}
}
