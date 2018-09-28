class postfix (

  String $service_name,
  Boolean $service_enable,
  String $service_ensure,
  Boolean $service_manage,
	Array $postfix_packages,
  String $configuration_directory,
  String $postfix_files_directory, 
  String $sasl_files_directory,
  $sasl_files_full_directory    = "${configuration_directory}/${sasl_files_directory}",
  $postfix_files_full_directory = "${configuration_directory}/${postfix_files_directory}", 
  Array $config_files,
  Array $access_files,
  Array $db_files,
  Array $postfix_files_content,
  Array $sasl_files,

  ) {

    anchor { 'postfix::begin': } ->
    class { '::postfix::install': } ->
    class { '::postfix::config': } ~>
    class { '::postfix::service': } ->
    anchor { 'postfix::end': }

}
