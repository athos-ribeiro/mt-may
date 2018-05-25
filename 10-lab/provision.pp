package {'java-1.8.0-openjdk':
  ensure => latest,
}

file {'install jenkins repository':
  path => '/etc/yum.repos.d/jenkins.repo',
  ensure => file,
  source => 'http://pkg.jenkins-ci.org/redhat/jenkins.repo',
}

exec {'import jenkins keys':
  command => '/usr/bin/rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key',
}


package {'jenkins':
  ensure => latest,
}

service {'jenkins':
  ensure   => running,
  enable   => true,
}
