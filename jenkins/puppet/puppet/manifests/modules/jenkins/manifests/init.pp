class jenkins {

	package { 'wget':
		ensure => present,
	}

	package { 'java-1.8.0-openjdk':
		ensure => present,
	}

	package { 'net-tools':
		ensure => present,
	}

	exec { 'retrieve-jenkins-war-file':
		command => '/usr/bin/wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war -O /opt/jenkins.war',
		creates => '/opt/jenkins.war',
	}

	file { '/opt/jenkins.war':
		mode => '755',
		require => Exec['retrieve-jenkins-war-file'],
	}

	exec { 'run-jenkins':
		command => '/usr/bin/java -jar /opt/jenkins.war --httpPort=8080 &',
		require => File['/opt/jenkins.war'],
	}
}
