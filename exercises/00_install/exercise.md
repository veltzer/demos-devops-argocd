# Install ArgoCD

* Install Minikube

* Create a namespace called `argocd`

```shell
kubectl create namespace argocd
```

* Create all k8s object having to do with ArgoCD by pulling the yaml from the web and their images:

```shell
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

* Create a port forwarder

```shell
kubectl port-forward svc/argocd-server -n argocd 8080:443 &
```

* Use the `ingree.yaml` in this folder:

```shell
kubectl apply -f ingree.yaml
```

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
