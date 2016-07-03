define systemd::config (
  $service,
  $options = {},
  $manage_service = false,
  $service_enable = undef,
  $service_ensure = undef,
) {
  validate_string($service)
  validate_string($service_ensure)
  validate_hash($options)
  validate_bool($service_enable)

  if $manage_service {
    service { "systemd-${service}":
      enable => $service_enable,
      ensure => $service_ensure;
    }
  }

  unless empty($options) {
    $known_section = {
      'bootchart' => 'Bootchart',
      'coredump'  => 'Coredump',
      'journald'  => 'Journal',
      'logind'    => 'Login',
      'system'    => 'Manager',
      'user'      => 'Manager',
    }

    if has_key($known_section, $service) {
      $section = $known_section[$service]
    } else {
      fail ("Unknown section for ${service}!")
    }

    create_ini_settings({ "${section}" => $options }, { 'path' => "/etc/systemd/${service}.conf" })
  }
}