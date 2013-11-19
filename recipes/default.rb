#
# Cookbook Name:: devbase
# Recipe:: default
#
# Copyright (C) 2013 Robert Jackiewicz
#
# All rights reserved - Do Not Redistribute
#

# Install Dev Tools
yum_package "emacs-nox"

# Install Ruby 2.0.0
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.0.0-p247" do
  ruby_version "2.0.0-p247"
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.0.0-p247"
end

# Install Postgresql
 include_recipe "postgresql::server"
include_recipe "postgresql::ruby"
postgresql_connection_info = {
  host: 'localhost',
  port: node['postgresql']['config']['port'],
  username: 'postgres',
  password: node['postgresql']['password']['postgres']
}
postgresql_database_user 'vagrant' do
  connection postgresql_connection_info
  password 'vagrant'
  action :create
end

# Install NodeJS
include_recipe 'nodejs'
