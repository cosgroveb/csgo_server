class opt {
  file { "/opt":
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 644,
  }
}
