#!/usr/bin/env bash
set -euo pipefail
IMAGE_NAME=boardgame-app:local
docker build -t ${IMAGE_NAME} .
echo "Running trivy image scan..."
trivy image --severity CRITICAL,HIGH,MEDIUM ${IMAGE_NAME} || true
