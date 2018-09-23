class postfix::config (

	$nodename = hiera('nodename'),
	$configuration_directory = hiera('configuration_directory'),
	$service_name = hiera('postfix::service::service_name'),
	$db_files = hiera('db_files'),
    
	) inherits postfix {

    file { $configuration_directory :
      ensure => present,
      sourceselect => all,
      source => ["puppet:///modules/postfix/${nodename}/etc/postfix","/etc/postfix "],
      recurse => true,
      notify   => Service[$service_name],  
    }

		$db_files.each |String $dbfile| {
			file { "/etc/postfix/${dbfile}":
				audit => 'content',
			}
    }

    $db_files.each |String $dbfile| {
        exec { "/usr/sbin/postmap ${configuration_directory}/${dbfile}" :
					path        => ['/usr/bin', '/usr/sbin'],
					subscribe   => File["/etc/postfix/${dbfile}"],
					refreshonly => true,
        }
		}

}
