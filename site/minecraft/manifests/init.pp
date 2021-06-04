class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/mincraft/minecraft_server.jar':
    ensure => file,
    source => 'http://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
