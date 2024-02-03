#!/bin/bash

# Set the image name
IMAGE_NAME="newapp"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image build successful: $IMAGE_NAME"
else
  echo "Error: Docker image build failed."
  exit 1
fi

