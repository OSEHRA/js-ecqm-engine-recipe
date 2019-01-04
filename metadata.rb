name             'ecqmEngine'
maintainer       'OSEHRA'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures Js-ecqm-engine'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'
depends          "apt",              "~> 6.1"
depends          "erlang",           "~> 6.0.0"
depends          "rabbitmq",         "~> 5.6.1"
