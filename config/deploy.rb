require 'fileutils'
require 'rubygems'
require 'supply_drop'

load "lib/supply_drop.rb"

ssh_options[:user] = ENV["USER"]
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/id_rsa"]
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :use_sudo, true
set :group_writable, false
set :user, ssh_options[:user]

SERVERS = %w[
  csgo01
]

SERVERS.each do |server|
  task server do
    role :server, server
  end
end

task :all do
  role :server, *SERVERS
end
