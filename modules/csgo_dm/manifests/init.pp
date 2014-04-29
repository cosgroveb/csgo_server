class csgo_dm (
  $steam_home_dir,
) {

  include csgo_dm::dependencies

  $csgo_ds_dir = "${steam_home_dir}/csgo_ds/csgo"

  exec { "csgo_dm_wget":
    command => "/usr/bin/wget 'https://forums.alliedmods.net/attachment.php?attachmentid=110919&d=1350306340' -O ${steam_home_dir}/dm.zip",
    unless  => "/bin/ls ${steam_home_dir}/dm.zip",
    user    => "steam",
  }

  exec { "csgo_dm_unzip":
    command => "/usr/bin/unzip ${steam_home_dir}/dm.zip -d ${csgo_ds_dir}",
    unless  => "/bin/ls ${csgo_ds_dir}/cfg/deathmatch/deathmatch.ini",
    user    => "steam",
  }

  Class["csgo_dm::dependencies"] -> Exec["csgo_dm_wget"] -> Exec["csgo_dm_unzip"]
}
