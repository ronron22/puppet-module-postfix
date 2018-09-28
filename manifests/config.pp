class postfix::config (

	String $configuration_directory,
	String $service_name = hiera('postfix::service::service_name'),
	Array $db_files,
  String $sasl_files_directory = "${configuration_directory}${sasl_files_directory} 
  String $postfix_files_directory = "${configuration_directory}${postfix_files_directory} 
    
	) inherits postfix {

  $config_files.each |String $file| {
    file { "${configuration_directory}${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}${file}"),
      require => File["${configuration_directory}"],
    }
  }

  $access_files.each |String $file| {
    file { "${configuration_directory}${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}${file}"),
      require => File["${configuration_directory}"],
    }
  }

  file { "${postfix_files_directory}":
    ensure => 'directory',
    mode    =>  '0755',
  }

  $postfix_files_content.each |String $file| {
    file { "${postfix_files_directory}${file}":
      content => file("postfix/${::fqdn}$${postfix_files_directory}}${file}"),
      require => File["${postfix_files_directory}"],
    }
  }

  file { "${sasl_files_directory}":
    ensure => 'directory',
    mode    =>  '0755',
  }

  $sasl_files.each |String $file| {
    file { "${sasl_files_directory}${file}":
      content => file("postfix/${::fqdn}${sasl_files_directory}${file}"),
      require => File["${sasl_files_directory}"],
    }
  }

  $db_files.each |String $dbfile| {
    file { "${configuration_directory}${dbfile}":
      audit => 'content',
      require => File["${dbfile}"],
    }
  }

  $db_files.each |String $dbfile| {
    exec {"postfix.recreate.${dbfile}":
      command => "/usr/sbin/postmap ${configuration_directory}/${dbfile}",
      path        => ['/usr/bin', '/usr/sbin'],
      subscribe   => File["${configuration_directory}${dbfile}"],
      refreshonly => true,
    }
  }

  $db_files.each |String $dbfile| {
    exec {"postfix.create.${dbfile}":
      command => "/usr/sbin/postmap ${configuration_directory}/${dbfile}", 
      path        => ['/usr/bin', '/usr/sbin'],
      onlyif =>  "test ! -f ${configuration_directory}/${dbfile}.db",
    }
  }

}
