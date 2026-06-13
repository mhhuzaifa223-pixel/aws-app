#!/bin/bash

echo "Starting deployment..."

echo "Pulling latest code..."
git pull origin main

echo "stopping old container"
docker stop aws-app-container || true
docker rm aws-app-container || true

echo "building image"
docker build -t aws-app

echo "Starting new container..."
docker run -d -p 3000:3000 --name aws-app-container aws-app

echo "Deployment completed!"

