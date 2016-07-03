class systemd (
  $unit_directory = $systemd::params::unit_directory,
  $unit_unit_default = $systemd::params::unit_unit_default,
  $unit_service_default = $systemd::params::unit_service_default,
  $unit_install_default = $systemd::params::unit_install_default,
) inherits systemd::params {

  ensure_resource('exec', 'systemctl deamon-reload', {
    command     => '/usr/bin/systemctl deamon-reload',
    refreshonly => true
  })
}