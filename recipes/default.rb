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
