class csgo::files (
  $steam_home_dir,
) {

  $csgo_install_dir = "${steam_home_dir}/csgo_ds/csgo"

  file { "${csgo_install_dir}/subscribed_collection_ids.txt":
    ensure => absent,
  }
  file { "${csgo_install_dir}/subscribed_file_ids.txt":
    ensure => absent,
  }
}
