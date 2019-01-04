## About

This recipe is designed to make it easier to deploy RabbitMQ and Js-Ecqm-Engine quickly.

### What it doesn't do:
- It will not download and install popHealth


## Installation Options
This recipe has been tested to work on Ubuntu 16.04 using the following install method:

### Chef Solo

    sudo apt-get update
    sudo apt-get -y install git-core wget
    wget https://packages.chef.io/files/stable/chefdk/2.0.26/ubuntu/16.04/chefdk_2.0.26-1_amd64.deb
    sudo dpkg -i chefdk_2.0.26-1_amd64.deb
    git clone https://github.com/giriraj0209/js-ecqm-engine-recipe.git
    cd js-ecqm-engine-recipe
    berks vendor cookbooks


To install Js-Ecqm-Engine run

    sudo chef-client -z -j install_ecqmEngine.json


