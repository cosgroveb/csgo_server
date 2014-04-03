class csgo {
  include steamcmd
  include csgo::game

  Class["steamcmd"] -> Class["csgo::game"]
}
