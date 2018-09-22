class postfix::install (

	$postfix_package    = hiera('postfix_package'),

	) inherits postfix {
        
		$apache_packages.each |String $package|{
			package { "$postfix_package": 
				ensure  =>  installed,
			}
		}

}
