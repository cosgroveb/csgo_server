set :remote_puppet_destination, "/tmp/supply_drop"
set :puppet_parameters, "--show_diff --confdir #{remote_puppet_destination} puppet.pp"
