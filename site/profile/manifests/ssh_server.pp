class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@maaster.puppet.vm':
    ensure  => present,
    user    => 'root',
    type    => 'ssh-rsa',
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDL3UydWBTVwd2/d8DaDMQW1BcMLOmiDPCf5lc9DrLqZTF6aHR5tv3f0VHpBYtMz/csyVprkhezfggX49oUK0BtiIIsOHoIlANucswOoiK6BSBlo90psvTO1iGyTuUML/fWQHPtnuX8Q4Tj7ZligcxzxNTyj84AFIDr6o7vPB/r7hOArzckWxPzCfvdMlwEWqnJPdA4u55lAnaG3CHFaC5S4lS8+nG4EPwBohD13i79wcIym+wonjiJs8ZBYLhJRZkqjsYjDG4bmHLifzHuGm7U6NHXZ/vuZDtxSjVGRQ1ifMTIWUmUb6z3bn2MkiFc1Q0iDiT8jEF7nhz1mR/UqLw3',
  }
}
