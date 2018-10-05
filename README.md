
# architux_postfix

## Todo

...

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

The idea behind this module is a strong separation **code** and **data**.  
Code is in *.pp and data only in *.yaml file's (in data/)

In my case, i combine Postfix with :

* ldap
* postscreen
* sasl
* ssl/tls
* cyrus
* milters
* policyd

## Setup

Today, only work on Debian.

Use this module with Puppet5 only please.

### Using it

```puppet
include postfix
```

or for override values 

```puppet
class { 'postfix':
  configuration_directory => '/etc/postfix',
}
```

in your profile directory by example.

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

Too long for describe.. read the *example/common.yaml* and the *manisfest/init.pp* files please.

## Limitations

Only work with debian..

## Development

No rules
