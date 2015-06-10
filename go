#! /usr/bin/env bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm rvmrc trust
cd spec
cd .. # hack to load RVMRC
set -e
gem install bundler --no-rdoc --no-ri
bundle install
rspec --format doc
