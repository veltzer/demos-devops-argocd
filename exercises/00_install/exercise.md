# Install ArgoCD

* Install Minikube

* Create a namespace called `argocd`

```shell
kubectl create namespace argocd
```

* Create all k8s object having to do with ArgoCD by pulling the yaml from the web and their images:

```shell
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

* Patch ArgoCD to not have TLS and allow access in port 30000 of the minikube ip:

```shell
kubectl port-forward svc/argocd-server -n argocd 8080:443 &
```

* Access your ArgoCD at `http://localhost:8080`, don't worry about the certificate not being signed.

* Use the `ingree.yaml` in this folder:

```shell
kubectl apply -f ingress.yaml
```

* Access your ArgoCD at `http://localhost:8080`, don't worry about the certificate not being signed.

* to get the admin password, user is `admin`

```shell
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d
```

## to remove ArgoCD use

```shell
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

## Links
* [Getting Started with ArgoCD](https://argo-cd.readthedocs.io/en/stable/getting_started)
