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

  ## templating
  Boolean $enable_debug,
  Boolean $enable_server_ssl,
  Boolean $enable_client_ssl,
  Boolean $enable_sasl,
  Boolean $enable_ldap_alias,
  Boolean $enable_message_size_limit,
  Boolean $enable_milter,
  Boolean $enable_smtpd_client_restrictions,
  Boolean $enable_smtpd_helo_restrictions, 
  Boolean $enable_smtpd_sender_restrictions,
  Boolean $enable_smtpd_recipient_restrictions,
  Boolean $enable_header_checks,
  Boolean $enable_mime_header_checks,
  Boolean $enable_mime_postscreen,
  Boolean $enable_mailbox_transport,
  Boolean $enable_virtual_mailbox_domains,
  Boolean $enable_virtual_mailbox_base,
  Boolean $enable_virtual_mailbox_maps,
  Boolean $enable_virtual_uid_maps,
  Boolean $enable_virtual_gid_maps,
  Boolean $enable_virtual_transport,

  ) {

  anchor { 'postfix::begin': } ->
  class { '::postfix::install': } ->
  class { '::postfix::config': } ~>
  class { '::postfix::service': } ->
  anchor { 'postfix::end': }

}
