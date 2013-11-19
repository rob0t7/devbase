#
# Cookbook Name:: devbase
# Attributes:: default
#
# Author:: Robert Jackiewicz (<rob@jackiewicz.ca>)
#
# Copyright 2013, Robert Jackiewicz
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

default[:rbenv][:group_users] = ['vagrant']

# Postgresql related attributes
default[:postgresql]['enable_pgdg_yum'] = true
default[:postgresql]['version'] = "9.3"
default[:postgresql]['dir'] = "/var/lib/pgsql/9.3/data"
default[:postgresql]['client']['packages'] = ["postgresql93", "postgresql93-devel"]
default[:postgresql][:server][:packages] = ["postgresql93-server"]
default[:postgresql][:server][:service_name] = "postgresql-9.3"
default[:postgresql][:contrib][:packages] = ["postgresql93-contrib"]
default[:postgresql]['password'] = {postgres: "vagrant"}
