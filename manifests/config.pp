class postfix::config (

	$nodename = hiera('nodename'),
	$configuration_directory = hiera('configuration_directory'),
	$service_name = hiera('postfix::service::service_name'),
    
	) inherits postfix {

    file { $configuration_directory :
      ensure => present,
      sourceselect => all,
      source => ["puppet:///modules/postfix/${nodename}/etc/postfix","/etc/postfix "],
      recurse => true,
      notify   => Service[$service_name],  
    }

    file { $postfix_db_files :
			ensure => present
      notify   => Exec[$postmap_file],  

		exec { '/usr/sbin/postmap $postfix_db_file':
			alias   => 'postmap_file'
			cwd     => '/var/tmp',
			path    => ['/usr/bin', '/usr/sbin',],
		}

    #file { "${configuration_directory}/$db_files" :
    #  ensure => present,
    #  notify   => Exec[postmap_file],
    #}  

    #exec { "/usr/sbin/postmap ${configuration_directory}/${db_file}":
    #  alias   => 'postmap_file',
    #  cwd     => '/var/tmp',
    #  path    => ['/usr/bin', '/usr/sbin',],        
    #  refreshonly => true,
    #}

    exec { 'my_command':
    command   => "/usr/sbin/postmap ${configuration_directory}/${db_file}",
    subscribe => [
    File["${configuration_directory}/${db_file}"],
  ],
  refreshonly => true,
  }

}
