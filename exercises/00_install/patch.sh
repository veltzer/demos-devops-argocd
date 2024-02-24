#!/bin/bash -e
# kubectl patch svc "argocd-server" -n "argocd" -p '{"spec": {"ports": [{"name": "http", "port": 80, "targetPort": 8080}]}}'
kubectl patch svc "argocd-server" -n "argocd" -p '{"spec":{"type":"NodePort","ports":[{"port":443,"nodePort":30000}]}}'
kubectl patch deployment "argocd-server" -n "argocd" -p '{"spec":{"template":{"spec":{"containers":[{"name": "argocd-server","args":["server","--insecure"]}]}}}}'
# kubectl patch svc "argocd-server" -n "argocd" -p '{"spec": {"type": "NodePort"}}'
# kubectl patch svc "argocd-server" -n "argocd" -p '{"spec": {"type": "LoadBalancer"}}'
