class steamcmd::package (
  $steam_home_dir,
) {

  exec { "steamcmd_wget":
    command => "/usr/bin/wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O ${steam_home_dir}/steamcmd.tar.gz",
    unless  => "/bin/ls ${steam_home_dir}/steamcmd.tar.gz",
    user    => "steam",
  }

  file { "${steam_home_dir}/steamcmd":
    ensure  => directory,
    owner   => "steam",
    group   => "steam",
    mode    => "644",
    require => Exec["steamcmd_wget"],
  }

  exec { "steamcmd_untar":
    command => "/bin/tar -C ${steam_home_dir}/steamcmd -xvzf ${steam_home_dir}/steamcmd.tar.gz",
    unless  => "/bin/ls ${steam_home_dir}/steamcmd/steamcmd.sh",
    user    => "steam",
    require => File["${steam_home_dir}/steamcmd"],
  }
}
