class systemd::unit::service(
  $unit,
  $service,
  $install,
  $manage_service       = true,
  $service_name         = $name,
  $service_ensure       = 'running',
  $service_enable       = true,
  $override             = true,
  $unit_unit_default    = $systemd::unit_unit_default,
  $unit_service_default = $systemd::unit_service_default,
  $unit_install_default = $systemd::unit_install_default,
  $unit_directory       = $systemd::unit_directory,
) {

  validate_string($name)
  validate_hash($unit)
  validate_hash($service)
  validate_hash($install)

  if $override == true {
    $_unit    = $unit
    $_service = $service
    $_install = $install
    $_dir     = "${unit_directory}/${name}.service.d"
    ensure_resource('file', $_dir, { ensure => 'directory'})
  } else {
    $_unit    = merge($unit_unit_default, $unit)
    $_service = merge($unit_service_default, $service)
    $_install = merge($unit_install_default, $install)
    $_dir     = $unit_directory
  }

  create_ini_settings({
    'Unit' => $_unit,
    'Service' => $_service,
    'Install' => $_install,
  }, {
    'path' => "${unit_unit_default}/${name}.service"
  })
~>
  Exec['systemctl deamon-reload']

}