#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <GitHub_Repo> <Docker_Repo> <Dockerfile>"
    echo "Example: $0 user/repo mydockerrepo/myimage Dockerfile"
    exit 1
fi

GITHUB_REPO=$1
DOCKER_REPO=$2
DOCKER_FILE=$3

echo "Cloning repository https://github.com/$GITHUB_REPO..."
git clone "https://github.com/$GITHUB_REPO" repo || { echo "Failed to clone repo"; exit 1; }
cd repo || { echo "Failed to enter repo directory"; exit 1; }

echo "Building Docker image..."
docker build -t "$DOCKER_REPO" -f "$DOCKER_FILE" . || { echo "Docker build failed"; exit 1; }

echo "Logging into Docker Hub..."
docker login || { echo "Docker login failed"; exit 1; }

echo "Pushing image to Docker Hub..."
docker push "$DOCKER_REPO" || { echo "Docker push failed"; exit 1; }

echo "Process completed successfully!"