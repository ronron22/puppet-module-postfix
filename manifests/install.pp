class postfix::install (

	$postfix_packages = hiera('postfix_packages'),

	) inherits postfix {
        
		$apache_packages.each |String $package|{
			package { "$postfix_package": 
				ensure  =>  installed,
			}
		}

}
