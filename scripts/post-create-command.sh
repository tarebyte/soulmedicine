#!/bin/sh

set -e

touch .env.local

gem install bundler:1.17.3
gem install erb_lint -v 0.1.3

npm install -g yarn
nodenv rehash

./bin/setup
