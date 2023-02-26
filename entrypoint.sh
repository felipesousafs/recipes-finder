#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /recipes/tmp/pids/server.pid

# Run db:create, migrate and seed.

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

exec "$@"
