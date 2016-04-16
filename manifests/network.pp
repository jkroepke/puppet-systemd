class systemctl::network (
  $disable_networkmanager
) {
  #disbale NetworkManager (RHEL/Debian?)
  #disable network
  #enable systemd-networkd
  #enable systemd-resolved
  #symlink /etc/resolv.conf

}

