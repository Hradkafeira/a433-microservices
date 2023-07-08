#!/bin/bash

#Build  Dockerfile
docker build -t hradkafeira/karsajobs:latest  .

#Adjust name with ghcr format
docker tag hradkafeira/karsajobs:latest ghcr.io/hradkafeira/karsajobs:latest

#Login to github
echo $PAT | docker login ghcr.io -u hradkafeira --password-stdin

#push to github packages
docker push ghcr.io/hradkafeira/karsajobs:latest
