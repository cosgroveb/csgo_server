class steamcmd::user (
  $steam_home_dir,
) {

  group { "steam":
    ensure => present,
  }

  user { "steam":
    ensure     => present,
    home       => $steam_home_dir,
    managehome => true,
    gid        => "steam",
    require    => Group["steam"],
    shell      => "/bin/bash",
  }
}
