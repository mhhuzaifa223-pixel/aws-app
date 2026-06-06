#!/bin/bash

echo "Starting deployment..."

echo "Pulling latest code..."
git pull origin main

echo "echo Start Server"
pm2 start app.js --name add

echo "Restarting app..."
pm2 restart app

echo "Saving PM2 state..."
pm2 save

echo "Deployment completed!"
