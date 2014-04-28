class scripts (
  $steam_home_dir,
  $workshop_collections,
) {

  file { "${steam_home_dir}/csgo_ds/start":
    ensure => present,
    content => template("scripts/start.sh.erb"),
    mode => 0744,
    owner => "steam",
    group => "steam",
  }
}
