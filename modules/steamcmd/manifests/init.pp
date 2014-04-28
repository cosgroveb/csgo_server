class steamcmd (
  $steam_home_dir,
) {

  class { "steamcmd::user":
    steam_home_dir => $steam_home_dir,
  }
  class { "steamcmd::package":
    steam_home_dir => $steam_home_dir,
  }

  Class["steamcmd::user"] -> Class["steamcmd::package"]
}
