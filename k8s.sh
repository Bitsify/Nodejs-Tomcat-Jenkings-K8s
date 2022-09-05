#!/bin/bash
scp deploymentservice.yml nnice@192.168.248.188:/home/nnice/Desktop
ssh nnice@192.168.248.188 '/home/nnice/Desktop/k8s-deploy.sh'
