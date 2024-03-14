# Deploy helm using Argo CD

* Create a new folder called "helm" with a helm chart in it.

* Use Argo CD to deploy that helm chart.

* Here is a piece of bash code that installs the latest version of helm:

```bash
rm -f "${HOME}/install/binaries/helm" /tmp/get_helm.sh
curl -fsSL -o /tmp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x /tmp/get_helm.sh
HELM_INSTALL_DIR="${HOME}/install/binaries" /tmp/get_helm.sh --no-sudo
rm -f /tmp/get_helm.sh
```
