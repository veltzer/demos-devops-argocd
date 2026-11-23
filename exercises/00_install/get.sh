#!/bin/bash -e

minikube_ip=$(minikube ip)
wget "https://${minikube_ip}:80/"
# wget https://$(minikube ip):80/
