class csgo (
  $steam_home_dir = hiera("steam::homedir"),
  $workshop_collections = hiera('workshop_collections'),
) {

  class { "steamcmd":
    steam_home_dir => $steam_home_dir,
  }
  class { "csgo::game":
    steam_home_dir => $steam_home_dir,
  }
  class { "csgo::files":
    steam_home_dir => $steam_home_dir,
  }
  class { "scripts":
    steam_home_dir => $steam_home_dir,
    workshop_collections => $workshop_collections,
  }
  class { "csgo_dm":
    steam_home_dir => $steam_home_dir,
  }

  Class["steamcmd"] -> Class["csgo::game"] -> Class["csgo::files"] -> Class["scripts"] -> Class["csgo_dm"]
}
