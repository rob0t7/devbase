name             'devbase'
maintainer       'Robert Jackiewicz'
maintainer_email 'rob@jackiewicz.ca'
license          'Apache 2.0'
description      'Installs/Configures devbase'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'devbase', 'Install the packages needed for NodeJS or Rails Development'

#depends 'crbenv'
depends 'rbenv'
depends 'ruby_build'
depends 'postgresql'
depends 'database'
depends 'nodejs'
depends 'npm'
depends 'nginx'
depends 'mongodb'

supports 'centos'
