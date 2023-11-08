#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bin/rails webpacker:install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
