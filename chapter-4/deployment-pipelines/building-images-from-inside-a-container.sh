#!/bin/bash
if [[ -z "$DOCKER_USER" || -z "$DOCKER_PWD" ]]; then
  echo "ERROR: Docker credentials not provided"
  exit 1
fi

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <GitHub_Repo> <Docker_Repo> <Dockerfile>"
    echo "Example: $0 user/repo mydockerrepo/myimage Dockerfile"
    exit 1
fi

GITHUB_REPO=$1
DOCKER_REPO=$2
DOCKER_FILE=$3

echo "Cloning repository https://github.com/$GITHUB_REPO..."
git clone "https://github.com/$GITHUB_REPO" repo

cd repo || { echo "Failed to enter repo directory"; exit 1; }

if [ ! -f "$DOCKER_FILE" ]; then
  echo "ERROR: Dockerfile not found at $DOCKER_FILE"
  ls -la $(dirname "$DOCKER_FILE")
  exit 1
fi

echo "Building Docker image..."
docker build -t "$DOCKER_REPO" -f "$DOCKER_FILE" . 

echo "Logging into Docker Hub..."
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin 

echo "Pushing image to Docker Hub..."
docker push "$DOCKER_REPO" || { echo "Docker push failed"; exit 1; }