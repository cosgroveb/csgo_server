class steamcmd {
  include steamcmd::user
  include steamcmd::package

  Class["steamcmd::user"] -> Class["steamcmd::package"]
}
