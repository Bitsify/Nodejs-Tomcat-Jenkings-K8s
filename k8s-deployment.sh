#!/bin/bash
#You can put this file on host where jenkins docker container is running, make sure you give it executable permissions
scp deploymentservice.yml rlinux@192.168.122.65:/home/rlinux 
echo "Performing deployment"
ssh rlinux@192.168.122.65 'kubectl apply -f deploymentservice.yml'
