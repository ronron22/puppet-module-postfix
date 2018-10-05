class postfix (

  String  $service_name,
  Boolean $service_enable,
  String  $service_ensure,
  Boolean $service_manage,
  Array   $postfix_packages,
  String  $configuration_directory,
  String  $postfix_files_directory, 
  String  $sasl_files_directory,
          $sasl_files_full_directory = "${configuration_directory}/${sasl_files_directory}",
          $postfix_files_full_directory = "${configuration_directory}/${postfix_files_directory}", 
  Array   $config_files,
  Array   $access_files,
  Array   $db_files,
  Array   $postfix_files_content,
  Array   $sasl_files,

  ## templating
  Optional[String]  $mail_name = undef,
  Optional[String]  $smtpd_banner = undef,
  Optional[String]  $myhostname = undef,
  Optional[String]  $mydomain = undef,
  Optional[String]  $smtp_helo_name = undef,

  Optional[Boolean] $enable_debug = undef,
  Optional[String]  $debug_peer_list = undef,
  Optional[String]  $soft_bounce = undef,
  Optional[String]  $delay_warning_time = undef,

  Optional[Boolean] $enable_server_ssl = undef,
  Optional[String]  $smtpd_tls_cert_file = undef,
  Optional[String]  $smtpd_tls_key_file = undef,
  Optional[String]  $smtpd_use_tls = undef,
  Optional[String]  $smtpd_tls_session_cache_database = undef,
  Optional[String]  $smtp_tls_session_cache_database = undef,
  Optional[Integer] $smtpd_tls_loglevel = undef,
  Optional[String]  $smtpd_tls_security_level = undef,
  Optional[String]  $smtpd_tls_received_header = undef,
  Optional[String]  $smtpd_tls_session_cache_timeout = undef,
  Optional[String]  $smtpd_tls_mandatory_protocols = undef,
  Optional[String]  $smtp_tls_mandatory_protocols = undef,
  Optional[String]  $smtpd_tls_protocols = undef,
  Optional[String]  $smtp_tls_protocols = undef,
  Optional[String]  $smtpd_tls_ciphers = undef,
  Optional[String]  $smtp_tls_mandatory_ciphers = undef,
  Optional[String]  $smtp_tls_mandatory_exclude_ciphers = undef,
  Optional[String]  $smtp_tls_exclude_ciphers = undef,

  Optional[Boolean] $enable_client_ssl = undef,
  Optional[String]  $smtp_use_tls = undef,
  Optional[String]  $smtp_tls_note_starttls_offer = undef,
  Optional[Integer] $smtp_tls_loglevel = undef,

  Optional[Boolean] $enable_sasl = undef,
  Optional[String]  $smtpd_sasl_local_domain = undef,
  Optional[String]  $smtpd_sasl_auth_enable = undef,
  Optional[String]  $broken_sasl_auth_clients = undef,
  Optional[String]  $smtpd_sasl_authenticated_header = undef,

  Optional[Boolean] $enable_ldap_alias = undef,
  Optional[String]  $ldapaliases_server_host = undef,
  Optional[String]  $ldapaliases_search_base = undef,
  Optional[String]  $ldapaliases_scope = undef,
  Optional[String]  $ldapaliases_query_filter = undef,
  Optional[String]  $ldapaliases_result_attribute = undef,
  Optional[String]  $alias_maps = undef,
  Optional[String]  $alias_database = undef,

  Optional[String]  $myorigin = undef,
  Optional[Array]   $relay_domains = undef,
  Optional[Array]   $mydestination = undef,
  Optional[String]  $relayhost = undef,
  Optional[Array]   $mynetworks = undef,
  Optional[String]  $sender_canonical_maps = undef,
  Optional[String]  $message_size_limit = undef,
  Optional[Integer] $mailbox_size_limit = undef,
  Optional[String]  $recipient_delimiter = undef,
  Optional[String]  $inet_interfaces = undef,
  Optional[String]  $inet_protocols = undef,
  Optional[String]  $html_directory = undef,

  Optional[Boolean] $enable_milters = undef,
  Optional[Array]   $smtpd_milters = undef,
  Optional[Array]   $non_smtpd_milters = undef,
  Optional[Integer] $milter_protocol = undef,
  Optional[String]  $milter_mail_macros = undef,
  Optional[String]  $milter_default_action = undef,

  Optional[Array]   $smtpd_client_restrictions = undef,
  Optional[Array]   $smtpd_helo_restrictions = undef, 
  Optional[Array]   $smtpd_sender_restrictions = undef,
  Optional[Array]   $smtpd_recipient_restrictions = undef,

  Optional[String]  $header_checks = undef,
  Optional[String]  $mime_header_checks = undef,

  Optional[Boolean] $enable_postscreen = undef,
  Optional[Array]   $postscreen_dnsbl_sites = undef,
  Optional[Array]   $postscreen_access_list = undef,
  Optional[String]  $postscreen_blacklist_action = undef,
  Optional[Integer] $postscreen_dnsbl_threshold = undef,
  Optional[String]  $postscreen_dnsbl_action = undef,
  Optional[String]  $postscreen_greet_banner = undef,
  Optional[String]  $postscreen_greet_action = undef,
  Optional[String]  $postscreen_pipelining_enable = undef,
  Optional[String]  $postscreen_pipelining_action = undef,
  Optional[String]  $postscreen_non_smtp_command_enable = undef,
  Optional[String]  $postscreen_non_smtp_command_action = undef,
  Optional[String]  $postscreen_bare_newline_enable = undef,
  Optional[String]  $postscreen_bare_newline_action = undef,

  Optional[String]  $mailbox_transport = undef,

  Optional[Array]   $virtual_mailbox_domains = undef,
  Optional[String]  $virtual_mailbox_base = undef,
  Optional[String]  $virtual_mailbox_maps = undef,
  Optional[String]  $virtual_uid_maps = undef,
  Optional[String]  $virtual_gid_maps = undef,
  Optional[String]  $virtual_transport = undef,

  Optional[Boolean] $cyrus = undef,
  Optional[Boolean] $policyd_spf = undef,
  Optional[Boolean] $submission = undef,
  Optional[Boolean] $smtps = undef,

  ) {

  anchor { 'postfix::begin': } ->
  class { '::postfix::install': } ->
  class { '::postfix::config': } ~>
  class { '::postfix::service': } ->
  anchor { 'postfix::end': }

}
