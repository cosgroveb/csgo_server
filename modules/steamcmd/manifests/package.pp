class steamcmd::package {
  $steamdir = hiera("steam::homedir")

  exec { "steamcmd_wget":
    command => "/usr/bin/wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O ${steamdir}/steamcmd.tar.gz",
    unless  => "/bin/ls ${steamdir}/steamcmd.tar.gz",
    user    => "steam",
  }

  file { "${steamdir}/steamcmd":
    ensure  => directory,
    owner   => "steam",
    group   => "steam",
    mode    => "644",
    require => Exec["steamcmd_wget"],
  }

  exec { "steamcmd_untar":
    command => "/bin/tar -C ${steamdir}/steamcmd -xvzf ${steamdir}/steamcmd.tar.gz",
    unless  => "/bin/ls ${steamdir}/steamcmd/steamcmd.sh",
    user    => "steam",
    require => File["${steamdir}/steamcmd"],
  }
}
