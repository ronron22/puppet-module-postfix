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
	String  $smtpd_sasl_local_domain,
	String  $smtpd_sasl_auth_enable,
	String  $broken_sasl_auth_clients,
	String  $smtpd_sasl_authenticated_header,
  Boolean $enable_ldap_alias,
  String  $ldapaliases_server_host,
  String  $ldapaliases_search_base,
  String  $ldapaliases_scope,
  String  $ldapaliases_query_filter,
  String  $ldapaliases_result_attribute,
  String  $alias_map,
  String  $sender_canonical_maps,
  String  $message_size_limit,
  Array   $milters,
  Array   $smtpd_milters,
  Array   $non_smtpd_milters,
  Array   $smtpd_client_restrictions,
  Array   $smtpd_helo_restrictions, 
  Array   $smtpd_sender_restrictions,
  Array   $smtpd_recipient_restrictions,
  String  $header_checks,
  String  $mime_header_checks,
  Boolean $enable_postscreen,
  Array   $postscreen_dnsbl_sites,
  String  $mailbox_transport,
  Array   $virtual_mailbox_domains,
  String  $virtual_mailbox_base,
  String  $virtual_mailbox_maps,
  String  $virtual_uid_maps,
  String  $virtual_gid_maps,
  String  $virtual_transport,

  ) {

  anchor { 'postfix::begin': } ->
  class { '::postfix::install': } ->
  class { '::postfix::config': } ~>
  class { '::postfix::service': } ->
  anchor { 'postfix::end': }

}
