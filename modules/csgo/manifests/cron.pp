class csgo::cron (
  $steam_home_dir = hiera("steam::homedir"),
) {
  cron { "update_and_run_server_nightly":
    command => "tmux kill-session -t csgo_ds; ${steam_home_dir}/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/steam/csgo_ds +app_update 740 +quit; tmux new -d -s csgo_ds && tmux send -t csgo_ds /opt/steam/csgo_ds/start Space competitive Enter",
    user => steam,
    hour => 5,
  }
}
