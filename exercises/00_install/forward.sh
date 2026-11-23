#!/bin/bash -e
sudo sysctl -w net.ipv4.ip_forward=1
minikube_ip=$(minikube ip)
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination "${minikube_ip}:30000"
