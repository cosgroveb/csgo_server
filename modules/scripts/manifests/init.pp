class scripts (
  $steam_home_dir,
  $workshop_collections,
  $maxplayers_override = hiera("csgo::arguments::maxplayers_override"),
) {

  file { "${steam_home_dir}/csgo_ds/start":
    ensure => present,
    content => template("scripts/start.sh.erb"),
    mode => 0744,
    owner => "steam",
    group => "steam",
  }
}
