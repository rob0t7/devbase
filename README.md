devbase cookbook
================

Install a development environment suitable for Rails or NodeJS development

Requirements
------------

### Cookbooks

The following cookbooks are direct dependencies:
    * rbenv
    * postgresql
    * database
    * nodejs
    * nginx

### Platforms

The following platforms are supported and tested:
    * CentOS 6.4

### Prereqs

Install plugins for Vagrant

    vagrant plugin install vagrant-berkshelf

### Instructions
Make sure your machine has nfs-server installed `sudo apt-get install nfs-kernel-server`
[Download Vagrant 1.4.3](http://www.vagrantup.com/download-archive/v1.4.3.html) and install
[Download the Vagrant box](http://192.168.1.78:81/Vagrant-UEMBase.box)


Author
------

Author:: Robert Jackiewicz (<rob@jackiewicz.ca>)

```text
Copyright 2008-2013, Robert Jackiewicz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
