#!/bin/bash

#Build  Dockerfile
docker build -t hradkafeira/karsajobs-ui:latest  .

#create tag with ghcr format
docker tag hradkafeira/karsajobs-ui:latest ghcr.io/hradkafeira/karsajobs-ui:latest

#Login to github
echo $PAT | docker login ghcr.io -u hradkafeira --password-stdin

#push to github packages
docker push ghcr.io/hradkafeira/karsajobs-ui:latest
