# @summary
#   This class handles the configuration file's.
#
# @api private
#

class postfix::config inherits postfix {

	# test
  file { '/etc/postfix/main.cf':
    ensure  => file,
    content => epp('postfix/main.cf.epp'),
  }

  file { '/etc/postfix/master.cf':
    ensure  => file,
    content => epp('postfix/master.cf.epp'),
  }

	# test
  $postfix::config_files.each |String $file| {
    file { "${postfix::configuration_directory}/${file}":
      content => file("postfix/${::fqdn}${postfix::configuration_directory}/${file}"),
    }
  }

  $postfix::access_files.each |String $file| {
    file { "${postfix::configuration_directory}/${file}":
      content => file("postfix/${::fqdn}${postfix::configuration_directory}/${file}"),
    }
  }

  file { "${postfix::postfix_files_full_directory}":
    ensure => 'directory',
    mode   => '0755',
  }

  $postfix::postfix_files_content.each |String $file| {
    file { "${postfix::postfix_files_full_directory}/${file}":
      content => file("postfix/${::fqdn}${postfix::postfix_files_full_directory}/${file}"),
    }
  }

  file { "${postfix::sasl_files_full_directory}":
    ensure => 'directory',
    mode   => '0755',
  }

  $postfix::sasl_files.each |String $file| {
    file { "${postfix::sasl_files_full_directory}${file}":
      content => file("postfix/${::fqdn}${postfix::sasl_files_full_directory}/${file}"),
    }
  }

  $postfix::db_files.each |String $dbfile| {
    file { "${postfix::configuration_directory}/${dbfile}":
      audit   => 'content',
      content => file("postfix/${::fqdn}${postfix::configuration_directory}/${dbfile}"),
    }
  }

  $postfix::db_files.each |String $dbfile| {
    exec {"postfix.recreate.${dbfile}":
      command     => "/usr/sbin/postmap ${postfix::configuration_directory}/${dbfile}",
      path        => ['/usr/bin', '/usr/sbin'],
      subscribe   => File["${postfix::configuration_directory}/${dbfile}"],
      refreshonly => true,
    }
  }

  $postfix::db_files.each |String $dbfile| {
    exec {"postfix.create.${dbfile}":
      command => "/usr/sbin/postmap ${postfix::configuration_directory}/${dbfile}",
      path    => ['/usr/bin', '/usr/sbin'],
      onlyif  => "test ! -f ${postfix::configuration_directory}/${dbfile}.db",
    }
  }

}
