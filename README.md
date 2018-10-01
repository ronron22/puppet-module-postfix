
# architux_postfix

## Todo

In config.pp, add source file's checking like

### Before

```puppet
$access_files.each |String $file| {
    file { "${configuration_directory}/${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}/${file}"),
      require => File["${configuration_directory}/main.cf"],
    }
  }
```

### After
 
```puppet
$access_files.each |String $file| {
    file { "${configuration_directory}/${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}/${file}"),
      require => File["postfix/${::fqdn}/${configuration_directory}/${file}"],
    }
  }
```



#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with architux_postfix](#setup)
    * [What architux_postfix affects](#what-architux_postfix-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with architux_postfix](#beginning-with-architux_postfix)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This a postfix module, it's a minimal module :
* install postfix with postscreen
* push of configuration files
* audit db file's for compiling them 
* compile db file's if needed

## Setup

Only work on Debian.
PLease use this module only on Puppet5.

```puppet
include postfix
```

or for override a value 

```puppet
class { 'postfix':
  configuration_directory => '/etc/postfix',
}
```

In your profile directory by example.

You can find all params on the top of init.pp

### Beginning with architux_postfix

Push configuration file's in hiera, sources files must exists !!!

## Usage

Define variables in hiera file's, don't forget to consult the hiera module file's in 

```puppet
postfix/hiera.yaml
```
et

```puppet
posfix/data/* 
```

## Reference

### $service_name

the service name

#### type String 

### $service_enable

if service must be enable

#### type Boolean 

### $service_ensure,

Status of service : running or stopped

#### type String 

### $service_manage

Is it managed ?

#### type Boolean

### $postfix_packages

Array of packages

#### type Array

### $configuration_directory

Normaly **/etc/postfix**

#### type String

### $postfix_files_directory

Normaly **/etc/postfix/postfix-files**

#### type String 

### $sasl_files_directory

Normaly **/etc/postfix/sasl/**

#### type String 

### Array $config_files

The main postfix configuration file's

Exemple

```puppet
postfix::config_files:
  - 'dynamicmaps.cf'
  - 'main.cf'
  - 'master.cf'
```

#### type Array

### Array $access_files

the postfix acl file's (not berkeley db)

Exemple

```puppet
postfix::access_files:
  - 'postscreen_access.cidr'
  - 'mime_header_checks'
  - 'header_checks'
  - 'filtered_domains'
```

#### type Array

### Array $db_files

the berkeley db file's, typicaly for postfix acl's

Exemple

```puppet
postfix::db_files:
  - sender_canonical
  - virtual
  - virtual_alias
  - client-access
  - helo-access
```

#### type Array

### Array $postfix_files_content

typically **/etc/postfix/postfix-files.d/**

Exemple

```puppet
postfix::postfix_files_content:
  - 'doc.files'
  - 'ldap.files'
  - 'pcre.files'
  - 'sqlite.files'
```

#### type Array

### Array $sasl_files

Content of **/etc/postfix/sasl/**

Exemple

```puppet
postfix::sasl_files:
  - 'smtp.conf'
  - 'smtpd.conf'
```

#### type Array

## Limitations

Only work with debian..

## Development

No rules

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
