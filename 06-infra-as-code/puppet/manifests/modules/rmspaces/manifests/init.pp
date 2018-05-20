class rmspaces {

	package { 'dnf-plugins-core':
		ensure => present,
	}

	exec { 'enable-rmspaces-copr-repo':
		command => '/usr/bin/dnf copr enable -y athoscr/extra',
		require => Package['dnf-plugins-core'],
	}

	package { 'rmspaces':
		ensure  => present,
		require => Exec['enable-rmspaces-copr-repo'],
	}
}
