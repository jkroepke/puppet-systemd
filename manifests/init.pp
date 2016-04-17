class systemd (
  $unit_directory = $systemd::params::unit_directory,
  $hostname = undef,
  $locale   = undef,
) inherits systemd::params {

  unless defined(Exec['systemctl deamon-reload']) {
    exec { 'systemctl deamon-reload':
      command     => '/usr/bin/systemctl deamon-reload',
      refreshonly => true
    }
  }

  unless empty($hostname) {
    class { 'systemd::hostname':
      hostname  => $hostname;
    }
  }

  unless empty($locale) {
    class { 'systemd::locale':
      locale  => $locale;
    }
  }
}