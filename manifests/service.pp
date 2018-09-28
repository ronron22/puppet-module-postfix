class postfix::service inherits postfix {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }
  if $service_manage == true {
    service { $service_name:
      ensure  => $service_ensure,
      enable  => $service_enable,
      provider => systemd,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
