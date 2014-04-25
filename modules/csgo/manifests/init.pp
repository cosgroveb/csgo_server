class csgo {
  include steamcmd
  include csgo::game
  include scripts

  Class["steamcmd"] -> Class["csgo::game"] -> Class["scripts"]
}
