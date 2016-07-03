class systemd::params {
  
  $unit_directory = '/etc/systemd/system'

  $unit_unit_default = { }
  $unit_service_default = { }
  $unit_install_default = {
    'WantedBy' => 'multi-user.target'
  }
}