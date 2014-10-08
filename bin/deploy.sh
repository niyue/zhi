#!/bin/sh

# set environment varibles in secrets
echo "Running deployment script..."
source ~/.bash_profile

echo "Redirecting port 80 to 9292..."
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 9292
sudo iptables -t nat -I OUTPUT -p tcp -o lo --dport 80 -j REDIRECT --to-ports 9292

bundle install

echo "Performing backup..."
RAILS_ENV=production backup perform --trigger zhi_backup -c db/backup.rb

echo "Migrate database..."
RAILS_ENV=production rake db:migrate

echo "Stopping server..."
bundle exec pumactl --pidfile log/puma.pid stop

echo "Starting server..."
bundle exec puma -e production -d --pidfile log/puma.pid

echo "Server is started."