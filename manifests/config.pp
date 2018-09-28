class postfix::config inherits postfix {

  $config_files.each |String $file| {
    file { "${configuration_directory}/${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}/${file}"),
    }
  }

  $access_files.each |String $file| {
    file { "${configuration_directory}/${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}/${file}"),
      require => File["${configuration_directory}/main.cf"],
    }
  }

  file { "${postfix_files_full_directory}":
    ensure => 'directory',
    mode    =>  '0755',
  }

  $postfix_files_content.each |String $file| {
    file { "${postfix_files_full_directory}/${file}":
      content => file("postfix/${::fqdn}${postfix_files_full_directory}/${file}"),
      require => File["${configuration_directory}/main.cf"],
    }
  }

  file { "${sasl_files_full_directory}":
    ensure => 'directory',
    mode    =>  '0755',
  }

  $sasl_files.each |String $file| {
    file { "${sasl_files_full_directory}${file}":
      content => file("postfix/${::fqdn}${sasl_files_full_directory}/${file}"),
      require => File["${configuration_directory}/main.cf"],
    }
  }

  $db_files.each |String $dbfile| {
    file { "${configuration_directory}/${dbfile}":
      audit => 'content',
      content => file("postfix/${::fqdn}/${configuration_directory}/${dbfile}"),
    }
  }

  $db_files.each |String $dbfile| {
    exec {"postfix.recreate.${dbfile}":
      command => "/usr/sbin/postmap ${configuration_directory}/${dbfile}",
      path        => ['/usr/bin', '/usr/sbin'],
      subscribe   => File["${configuration_directory}/${dbfile}"],
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
