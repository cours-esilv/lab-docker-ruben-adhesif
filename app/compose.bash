#!/bin/bash

docker-compose up -d
docker-compose logs
docker-compose up -d --scale backend-service=3