class postfix::install inherits postfix {
        
  $postfix_packages.each |String $package|{
    package { $package: 
      ensure  =>  installed,
    }
  }

}
