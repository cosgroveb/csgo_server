class csgo::game {
  $steamdir = hiera("steam::homedir")

  file { "${steamdir}/csgo_ds":
    ensure  => directory,
    owner   => "steam",
    group   => "steam",
    mode    => "644",
  }

  exec { "install_csgo":
    command => "${steamdir}/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${steamdir}/csgo_ds +app_update 740 +quit",
    user    => "steam",
    require => File["${steamdir}/csgo_ds"],
    timeout => 1800,
  }
}
