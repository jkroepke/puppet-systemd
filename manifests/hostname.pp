class systemd::hostname (
  $hostname = undef,
  $icon = undef,
  $chassis = undef,
  $deployment = undef,
  $location = undef,
) {
  unless empty($hostname) {
    exec { "hostnamectl set-hostname ${hostname}":
      command => "/usr/bin/hostnamectl --no-ask-password set-hostname '${hostname}'",
      unless  => "/usr/bin/hostnamectl status | grep -q 'Static hostname: ${hostname}'";
    }
  }

  unless empty($icon) {
    exec { "hostnamectl set-icon-name ${icon}":
      command => "/usr/bin/hostnamectl --no-ask-password set-icon-name '${icon}'",
      unless  => "/usr/bin/hostnamectl status | grep -q 'Icon name: ${icon}'";
    }
  }

  unless empty($chassis) {
    exec { "hostnamectl set-chassis ${chassis}":
      command => "/usr/bin/hostnamectl --no-ask-password set-chassis '${chassis}'",
      unless  => "/usr/bin/hostnamectl status | grep -q 'Chassis: ${chassis}'";
    }
  }

  unless empty($deployment) {
    exec { "hostnamectl set-deployment ${deployment}":
      command => "/usr/bin/hostnamectl --no-ask-password set-deployment '${deployment}'",
      unless  => "/usr/bin/hostnamectl status | grep -q 'Deployment: ${deployment}'";
    }
  }

  unless empty($location) {
    exec { "hostnamectl set-location ${location}":
      command => "/usr/bin/hostnamectl --no-ask-password set-location '${location}'",
      unless  => "/usr/bin/hostnamectl status | grep -q 'Location: ${location}'";
    }
  }
}