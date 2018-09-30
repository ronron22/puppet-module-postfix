
# architux_postfix

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

then service name

#### type String 

### $service_enable

if service must be enable

#### type Boolean 

### $service_ensure,

Status of service : running or stopped

#### type String 
###  Boolean $service_manage,
###  Array $postfix_packages,
###  String $configuration_directory,
###  String $postfix_files_directory, 
###  String $sasl_files_directory,
###  $sasl_files_full_directory    = "${configuration_directory}/${sasl_files_directory}",
###  $postfix_files_full_directory = "${configuration_directory}/${postfix_files_directory}", 
###  Array $config_files,
###  Array $access_files,
###  Array $db_files,
###  Array $postfix_files_content,
###  Array $sasl_files,

## Limitations

In the Limitations section, list any incompatibilities, known issues, or other warnings.

## Development

In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
