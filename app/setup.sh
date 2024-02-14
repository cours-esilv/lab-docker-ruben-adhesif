#!\bin\bash

# Add this script to reload quickly docker and iterate
# bash app/setup.sh

# Clean docker
docker stop backend
docker stop frontend
docker rm backend
docker rm frontend
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
docker run -d --name backend --network my-network -p 5000:5000 back
docker run -d --name frontend --network my-network -p 8000:8000 -e WS_BACK_URL=backend:5000 front
echo