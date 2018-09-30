
# architux_postfix

## Todo

In config.pp, add source file's checking like

### Before

```bash
$access_files.each |String $file| {
    file { "${configuration_directory}/${file}":
      content => file("postfix/${::fqdn}/${configuration_directory}/${file}"),
      require => File["${configuration_directory}/main.cf"],
    }
  }
```

### After
 
```bash
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

```bash
include postfix
```

You can find all params on the top of init.pp


### Beginning with architux_postfix

Push configuration file's in hiera, files must exists !!!

## Usage

Define variables in hiera file's, don't forget to consult the hiera module file's in 

```bash
postfix/hiera.yaml
```
et

```bash
posfix/data/* 
```


## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

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

It is managed ?

#### type Boolean

### $postfix_packages

Array of packages name's

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

```bash
postfix::config_files:
  - 'dynamicmaps.cf'
  - 'main.cf'
  - 'master.cf'
```

#### type Array

### Array $access_files

the postfix acl file's

Exemple

```bash
postfix::access_files:
  - 'postscreen_access.cidr'
  - 'mime_header_checks'
  - 'header_checks'
  - 'filtered_domains'
```

#### type Array

### Array $db_files

the db file's, typicaly for postfix acl's

Exemple

```bash
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

```bash
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

```bash
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
