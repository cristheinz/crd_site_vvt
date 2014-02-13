# Installation

## Clone:
    $ git clone https://github.com/cristheinz/crd_site_vvt.git

## Replace sensitive information in files:
* /config/environments/production.rb

## Install:
    $ bundle install

## Creates database:
    $ bundle exec rake db:migrate RAILS_ENV="production"

## Populate database:
    $ bundle exec rake db:seed RAILS_ENV="production"
