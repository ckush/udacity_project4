#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=ckush/udacity_project4


# Step 2
# Run the Docker Hub container with kubernetes
#kubectl create deploy myappkuber --image=$dockerpath
kubectl run myappkuber --image=$dockerpath --port=8000

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
LABEL_SELECTOR="app=myappkuber"
#POD_NAME=$(kubectl get pods -l $LABEL_SELECTOR -o jsonpath='{.items[0].metadata.name}')
POD_NAME="myappkuber"
kubectl port-forward pod/$POD_NAME --address 0.0.0.0 8000:80
