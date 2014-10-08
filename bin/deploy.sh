#!/bin/sh

# set environment varibles in secrets
echo "Running deployment script..."
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm get stable --auto-dotfiles
ruby -v

echo "Redirecting port 80 to 9292..."
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 9292
sudo iptables -t nat -I OUTPUT -p tcp -o lo --dport 80 -j REDIRECT --to-ports 9292
# sudo yum -y install sqlite-devel

echo "Installing bundle/Rubygems..."
gem install bundle
bundle install

echo "Performing backup..."
RAILS_ENV=production rake db:data:dump
mkdir -p db/backups
DATE=$(date +"%Y%m%d_%H%M%S")
mv db/data.yml db/backups/data_$DATE.yml

echo "Precompiling assets"
RAILS_ENV=production rake assets:precompile

echo "Migrate database..."
RAILS_ENV=production rake db:migrate

echo "Stopping server..."
bundle exec pumactl --pidfile log/puma.pid stop

echo "Starting server..."
bundle exec puma -e production -d --pidfile log/puma.pid

echo "Server is started."
