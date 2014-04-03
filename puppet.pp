import "modules/*/*/*.pp"

node csgo01 {
  $packages = [
    "curl",
    "lsof",
    "rsync",
    "lib32gcc1",
  ]
  package { $packages:
    ensure => installed,
    before => Class["csgo"]
  }

  include opt
  include csgo

  Class["opt"] -> Class["csgo"]
}
