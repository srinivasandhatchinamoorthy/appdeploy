#!/bin/bash

# Set your Docker Hub username
DOCKER_USERNAME="srinivasandhatchinamoorthy"
DOCKER_PASSWORD="dckr_pat_CGOUa0xUFj8iTMJNN0a5PYV8lr0"


# Set the image name
IMAGE_NAME="prod"

# Build the Docker image
docker build -t $DOCKER_USERNAME/$IMAGE_NAME .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image build successful: $DOCKER_USERNAME/$IMAGE_NAME"
else
  echo "Error: Docker image build failed."
  exit 1
fi

# Login to Docker Hub
echo "Logging in to Docker Hub..."
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Push the image to Docker Hub
docker push $DOCKER_USERNAME/$IMAGE_NAME

# Check if the push was successful
if [ $? -eq 0 ]; then
  echo "Docker image push successful: $DOCKER_USERNAME/$IMAGE_NAME"
else
  echo "Error: Docker image push failed."
  exit 1
fi

# Logout from Docker Hub
docker logout

# Optionally, remove the local image if you don't need it
# docker rmi $DOCKER_USERNAME/$IMAGE_NAME

