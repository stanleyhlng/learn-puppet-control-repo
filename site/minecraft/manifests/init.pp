class minecraft (
  $url = 'http://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar',
  $install_dir = '/opt/minecraft'
) {
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service', {
      install_dir => $install_dir,
    })
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [
      Package['java'],
      File['/etc/systemd/system/minecraft.service'],
    ],
  }
}
