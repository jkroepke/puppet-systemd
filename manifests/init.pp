class systemd (
  $unit_file_dir,
) {

  exec { 'systemctl deamon-reload':
    refreshonly => true
  }
}