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

}
