class csgo::game (
  $steam_home_dir,
) {

  file { "${steam_home_dir}/csgo_ds":
    ensure  => directory,
    owner   => "steam",
    group   => "steam",
    mode    => "644",
  }

  exec { "install_csgo":
    command => "${steam_home_dir}/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${steam_home_dir}/csgo_ds +app_update 740 +quit",
    user    => "steam",
    require => File["${steam_home_dir}/csgo_ds"],
    timeout => 1800,
  }

  file { "${steam_home_dir}/.steam":
    ensure => directory,
    owner => "steam",
    group => "steam",
    mode => "644",
  }

  file { "${steam_home_dir}/.steam/sdk32":
    ensure => link,
    target => "${steam_home_dir}/csgo_ds/bin",
    require => File["${steam_home_dir}/.steam"],
  }
}
