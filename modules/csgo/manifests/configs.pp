class csgo::configs (
  $steam_home_dir,
  $gamemodes = undef,
) {
  if $gamemodes {
    create_resources("csgo::gamemodes", $gamemodes, { 'steam_home_dir' => $steam_home_dir })
  }
}
