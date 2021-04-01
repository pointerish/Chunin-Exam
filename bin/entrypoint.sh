#!/bin/sh

set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

bundle exec rake db:migrate RAILS_ENV=production 2>/dev/null || \
bundle exec rake db:seed RAILS_ENV=production 2>/dev/null

exec bundle exec "$@"