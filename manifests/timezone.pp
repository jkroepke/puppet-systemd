class systemd::timezone(
  $timezone = undef
) {
  unless empty($timezone) {
    exec { "timedatectl set-timezone ${timezone}":
      command => "/usr/bin/timedatectl set-timezone '${timezone}'",
      unless  => "/usr/bin/timedatectl status | grep -qe 'Time zone:.*${timezone}'";
    }
  }
}