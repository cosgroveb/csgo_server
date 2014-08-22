define csgo::gamemodes (
  $steam_home_dir,
  $gamemode = {},
) {
  file { "${steam_home_dir}/csgo_ds/csgo/cfg/${name}.cfg":
    ensure => file,
    content => template("csgo/gamemode.cfg.erb"),
    mode => 0644,
    owner => root,
    group => steam,
  }
}
