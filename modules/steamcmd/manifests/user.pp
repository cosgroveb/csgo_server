class steamcmd::user {
  group { "steam":
    ensure => present,
  }

  user { "steam":
    ensure     => present,
    home       => hiera("steam::homedir"),
    managehome => true,
    gid        => "steam",
    require    => Group["steam"],
    shell      => "/bin/bash",
  }
}
