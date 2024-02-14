#!/bin/bash

# Add this script to reload quickly docker and iterate
# sh app/setup.sh

# Clean docker
docker stop backend frontend
docker rm backend frontend
docker rmi back 
docker rmi front
docker network rm my-network
echo

# Build images
cd back
docker build -t back .
cd ../front
docker build -t front .
cd ..
echo

# Run containers
docker network create my-network
docker run -d --name backend --network my-network -p 5000:80 back
docker run -d --name frontend --network my-network -p 8000:80  front
echo

# Test connection
docker exec -it frontend bash
curl ${WS_BACK_URL}/write/Hello%20World
curl ${WS_BACK_URL}/get/Hello%20World