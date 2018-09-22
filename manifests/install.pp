class postfix::install (

	$postfix_package    = hiera('postfix_package'),

	) inherits postfix {
        
		package { "$postfix_package": 
			ensure  =>  installed,
		}

}
