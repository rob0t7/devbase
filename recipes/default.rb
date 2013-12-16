#
# Cookbook Name:: devbase
# Recipe:: default
#
# Copyright (C) 2013 Robert Jackiewicz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install Dev Tools
yum_package "emacs-nox"
yum_package "sqlite-devel"

# Install ZSH
package "zsh" do
  action :install
end
git "/home/vagrant/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
  not_if "test -d /home/vagrant/.oh-my-zsh"
end
template "/home/vagrant/.zshrc" do
  source "zshrc.erb"
  owner "vagrant"
  group "vagrant"
  action :create_if_missing
end
bash "change chsh" do
  user "root"
  code "chsh -s /bin/zsh vagrant"
end

# Install Ruby for the vagrant user
node.default['rbenv']['user_installs'] = [
  {
    user: 'vagrant',
    rubies: ['2.0.0-p247'],
    gems: { '2.0.0-p247' => [ {'name' => 'bundler', 'version' => '1.3.5'}] }
  }
]
include_recipe "ruby_build"
include_recipe "rbenv::user"

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

# Install Nginx
include_recipe 'nginx'
