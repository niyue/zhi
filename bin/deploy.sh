#!/bin/sh

echo "Running deployment script..."

echo "Redirecting port 80 to 9292..."
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 9292
sudo iptables -t nat -I OUTPUT -p tcp -o lo --dport 80 -j REDIRECT --to-ports 9292

echo "Server is started."
