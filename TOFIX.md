# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `exercises/00_install/exercise.md:42` - the removal command deletes `core-install.yaml`, but the install step (`exercise.md:14`, `apply.sh:3`) applies `install.yaml`; following the doc leaves most ArgoCD objects behind. Use `install.yaml`, as `delete.sh:3` already does.
- `exercises/00_install/ingress.yaml:3` - the Ingress has no `namespace` and `exercise.md:28` applies it without `-n argocd`, so it lands in `default` while its backend `argocd-server` lives in `argocd`; an Ingress can only route to Services in its own namespace. Add `namespace: argocd` to the metadata (or `-n argocd` to the command).

## Medium

- `exercises/00_install/exercise.md:19` - the bullet says "Patch ArgoCD to not have TLS and allow access in port 30000", but the command under it (`:22`) is a `kubectl port-forward ... 8080:443`, and `:31` then says to open `http://localhost:8080` while also warning about an unsigned certificate. The patch it describes is `patch.sh`; either reference `patch.sh` + `open.sh` (NodePort 30000, `--insecure`) here, or reword the bullet to describe the port-forward and use `https://localhost:8080`.
- `exercises/00_install/get.sh:3` - fetches `https://<minikube-ip>:80/`: HTTPS on port 80, a port that `patch.sh` does not expose (it maps the service to NodePort 30000 and runs the server `--insecure`). Use `http://$(minikube ip):30000/` like `open.sh:2`, and drop the duplicated commented-out line `:4`.
- `rsconstruct.toml` - `config/project.lua` is never linted although the repo carries the fleet `.luacheckrc` for exactly that file; 109 fleet repos have `[processor.luacheck]` with `src_dirs = ["config"]`. Add it (and declare nothing else - luacheck comes from the rsconstruct tool registry).

## Low

- `README.md:2` - typo "AegoCD" (should be ArgoCD); also the README does not mention the `exercises/` layout at all. `config/project.lua:3` already has the correct description.
- `.k8s.conf` - a personal minikube kubeconfig (absolute `/home/mark/.minikube/...` paths, a 2024 cluster IP) that nothing in the repo references; delete it.
- `exercises/00_install/mapping.yaml` - unreferenced by any exercise or script, and uses Ambassador's `getambassador.io/v2` API which current Emissary releases no longer serve; delete it or wire it into `exercise.md` with a current API version.
- `exercises/03_argo_command_line/exercise.md:10` - stray `...` line inside the bullet list; replace with real sub-items or remove.
- `.aspell.en.prepl` - no aspell processor is configured (spelling runs through zspell with `.zspell-words`), so this file is dead; fleet-wide: 16 repos carry the same unused file and it should be removed everywhere at once.
