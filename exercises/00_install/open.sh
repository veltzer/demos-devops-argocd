#!/bin/bash -e
minikube_ip=$(minikube ip)
xdg-open "http://${minikube_ip}:30000/"
