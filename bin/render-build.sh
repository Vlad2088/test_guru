#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
bin/rails webpacker:install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bin/rails db:migrate
